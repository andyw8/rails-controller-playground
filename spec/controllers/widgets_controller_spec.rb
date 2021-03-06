require 'spec_helper'

describe WidgetsController do
  let(:valid_attributes) { { "name" => "MyString" } }
  let(:valid_session) { {} }
  let(:widget) { mock_model('Widget') }
  before { allow(Widget).to receive(:find).with(widget.to_param).and_return(widget) }

  describe "GET index" do
    it "assigns all widgets as @widgets" do
      widgets = double
      allow(Widget).to receive(:all).and_return(widgets)
      get :index, {}, valid_session
      expect(assigns(:widgets)).to eq(widgets)
    end
  end

  describe "GET show" do
    it "assigns the requested widget as @widget" do
      get :show, {:id => widget.to_param}, valid_session
      expect(assigns(:widget)).to eq(widget)
    end
  end

  describe "GET new" do
    it "assigns a new widget as @widget" do
      allow(Widget).to receive(:new).and_return(widget)
      get :new, {}, valid_session
      expect(assigns(:widget)).to eq(widget)
    end
  end

  describe "GET edit" do
    it "assigns the requested widget as @widget" do
      get :edit, {:id => widget.to_param}, valid_session
      expect(assigns(:widget)).to eq(widget)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before { allow(Widget).to receive(:new).with(valid_attributes).and_return(widget) }

      it "creates a new Widget" do
        expect(widget).to receive(:save)
        post :create, {:widget => valid_attributes}, valid_session
      end

      it "assigns a newly created widget as @widget" do
        allow(widget).to receive(:save)
        post :create, {:widget => valid_attributes}, valid_session
        expect(assigns(:widget)).to eq(widget)
      end

      it "redirects to the created widget" do
        allow(widget).to receive(:save).and_return(true)
        post :create, {:widget => valid_attributes}, valid_session
        expect(response).to redirect_to(widget)
      end
    end

    describe "with invalid params" do
      before { allow_any_instance_of(Widget).to receive(:save).and_return(false) }

      it "assigns a newly created but unsaved widget as @widget" do
        post :create, {:widget => { "name" => "invalid value" }}, valid_session
        expect(assigns(:widget)).to be_a_new(Widget) # fix this later
      end

      it "re-renders the 'new' template" do
        post :create, {:widget => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    it "updates the requested widget" do
      expect(widget).to receive(:update).with({ "name" => "MyString" })
      put :update, {:id => widget.to_param, :widget => { "name" => "MyString" }}, valid_session
    end

    it "assigns the requested widget as @widget" do
      allow(widget).to receive(:update).with({ "name" => "MyString" })
      put :update, {:id => widget.to_param, :widget => valid_attributes}, valid_session
      expect(assigns(:widget)).to eq(widget)
    end

    describe "with valid params" do
      it "redirects to the widget" do
        allow(widget).to receive(:update).with({ "name" => "MyString" }).and_return(true)
        put :update, {:id => widget.to_param, :widget => valid_attributes}, valid_session
        expect(response).to redirect_to(widget)
      end
    end

    describe "with invalid params" do
      before { allow(widget).to receive(:update).and_return(false) }

      it "re-renders the 'edit' template" do
        put :update, {:id => widget.to_param, :widget => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested widget" do
      expect(widget).to receive(:destroy)
      delete :destroy, {:id => widget.to_param}, valid_session
    end

    it "redirects to the widgets list" do
      delete :destroy, {:id => widget.to_param}, valid_session
      expect(response).to redirect_to(widgets_url)
    end
  end
end
