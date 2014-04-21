require 'spec_helper'

describe WidgetsController do
  let(:valid_attributes) { { "name" => "MyString" } }
  let(:valid_session) { {} }
  let(:widget) { Widget.create! valid_attributes }
  let(:widget_double) { double }

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
      expect(Widget).to receive(:find).with("7").and_return(widget_double)
      get :show, {:id => 7}, valid_session
      expect(assigns(:widget)).to eq(widget_double)
    end
  end

  describe "GET new" do
    it "assigns a new widget as @widget" do
      expect(Widget).to receive(:new).and_return(widget_double)
      get :new, {}, valid_session
      expect(assigns(:widget)).to eq(widget_double)
    end
  end

  describe "GET edit" do
    it "assigns the requested widget as @widget" do
      expect(Widget).to receive(:find).with("7").and_return(widget_double)
      get :edit, {:id => 7}, valid_session
      expect(assigns(:widget)).to eq(widget_double)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:widget_double) { mock_model('Widget') }
      before do
        expect(Widget).to receive(:new).with(valid_attributes).and_return(widget_double)
      end

      it "creates a new Widget" do
        expect(widget_double).to receive(:save)
        post :create, {:widget => valid_attributes}, valid_session
      end

      it "assigns a newly created widget as @widget" do
        expect(widget_double).to receive(:save)
        post :create, {:widget => valid_attributes}, valid_session
        expect(assigns(:widget)).to eq(widget_double)
      end

      it "redirects to the created widget" do
        expect(widget_double).to receive(:save).and_return(true)
        post :create, {:widget => valid_attributes}, valid_session
        expect(response).to redirect_to(widget_double)
      end
    end

    describe "with invalid params" do
      before do
        allow_any_instance_of(Widget).to receive(:save).and_return(false)
        post :create, {:widget => { "name" => "invalid value" }}, valid_session
      end

      it "assigns a newly created but unsaved widget as @widget" do
        expect(assigns(:widget)).to be_a_new(Widget)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested widget" do
        expect_any_instance_of(Widget).to receive(:update).with({ "name" => "MyString" })
        put :update, {:id => widget.to_param, :widget => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested widget as @widget" do
        put :update, {:id => widget.to_param, :widget => valid_attributes}, valid_session
        expect(assigns(:widget)).to eq(widget)
      end

      it "redirects to the widget" do
        put :update, {:id => widget.to_param, :widget => valid_attributes}, valid_session
        expect(response).to redirect_to(widget)
      end
    end

    describe "with invalid params" do
      before do
        allow_any_instance_of(Widget).to receive(:save).and_return(false)
        put :update, {:id => widget.to_param, :widget => { "name" => "invalid value" }}, valid_session
      end

      it "assigns the widget as @widget" do
        expect(assigns(:widget)).to eq(widget)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested widget" do
      widget # reference the 'let' block to trigger the creation
      expect {
        delete :destroy, {:id => widget.to_param}, valid_session
      }.to change(Widget, :count).by(-1)
    end

    it "redirects to the widgets list" do
      delete :destroy, {:id => widget.to_param}, valid_session
      expect(response).to redirect_to(widgets_url)
    end
  end
end
