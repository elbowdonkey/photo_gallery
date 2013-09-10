require 'spec_helper'

describe Api::GalleriesController do
  describe "GET index" do
    let(:gallery_a) { FactoryGirl.create(:gallery) }
    let(:gallery_b) { FactoryGirl.create(:gallery) }
    let(:gallery_c) { FactoryGirl.create(:gallery) }

    subject(:galleries) { assigns(:galleries) }

    context "when signed in" do
      before(:each) do
        sign_in gallery_a.user
      end

      it "excludes other users' empty galleries" do
        # ours is the empty one, and should show
        # the populated one is someone elses
        # but a third one is empty and not ours, so shouldn't show
        our_gallery   = gallery_a
        other_gallery = gallery_b
        empty_gallery = gallery_c

        other_gallery.photos.create(filepicker_url: "http://foo")

        get :index
        expect(galleries.length).to eq(2)
        expect(galleries.first).to eq(our_gallery)
        expect(galleries.last).to  eq(other_gallery)
      end

      it "should allow us to start a new gallery" do
        get :new
        expect(response).to render_template("new")
      end

      it "should create a new gallery" do
        user = gallery_a.user

        post :create, gallery: {title: "foo"}

        expect(response).to redirect_to(gallery_url(assigns(:gallery)))
      end
    end

    context "when not signed in" do
      it "should show all non empty galleries" do
        gallery_a.photos.create(filepicker_url: "http://foo")

        get :index
        expect(galleries.length).to eq(1)
      end

      it "should not be able to create a new gallery" do
        get :new
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context "as javascript client" do
      render_views

      context "when signed in" do
        before(:each) do
          sign_in gallery_a.user

          gallery_a.photos.create(filepicker_url: "http://foo1")
          gallery_a.photos.create(filepicker_url: "http://foo2")
          gallery_b.photos.create(filepicker_url: "http://foo3")
          gallery_b.photos.create(filepicker_url: "http://foo4")
        end

        it "#index" do
          get :index, format: :json
          expect(response.header['Content-Type']).to include('application/json')
        end

        it "#show/n" do
          get :show, format: :json, id: gallery_a.id
          expect(response.header['Content-Type']).to include('application/json')
        end
      end
    end
  end
end
