require 'spec_helper'

describe WidgetsController do
  let(:valid_attributes) { { "name" => "MyString" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all widgets as @widgets" do
      widget = Widget.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:widgets)).to eq([widget])
    end
  end

  describe "GET show" do
    it "assigns the requested widget as @widget" do
      widget = Widget.create! valid_attributes
      get :show, {:id => widget.to_param}, valid_session
      expect(assigns(:widget)).to eq(widget)
    end
  end

  describe "GET new" do
    it "assigns a new widget as @widget" do
      get :new, {}, valid_session
      expect(assigns(:widget)).to be_a_new(Widget)
    end
  end

  describe "GET edit" do
    it "assigns the requested widget as @widget" do
      widget = Widget.create! valid_attributes
      get :edit, {:id => widget.to_param}, valid_session
      expect(assigns(:widget)).to eq(widget)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Widget" do
        expect {
          post :create, {:widget => valid_attributes}, valid_session
        }.to change(Widget, :count).by(1)
      end

      it "assigns a newly created widget as @widget" do
        post :create, {:widget => valid_attributes}, valid_session
        expect(assigns(:widget)).to be_a(Widget)
        expect(assigns(:widget)).to be_persisted
      end

      it "redirects to the created widget" do
        post :create, {:widget => valid_attributes}, valid_session
        expect(response).to redirect_to(Widget.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved widget as @widget" do
        allow_any_instance_of(Widget).to receive(:save).and_return(false)
        post :create, {:widget => { "name" => "invalid value" }}, valid_session
        expect(assigns(:widget)).to be_a_new(Widget)
      end

      it "re-renders the 'new' template" do
        allow_any_instance_of(Widget).to receive(:save).and_return(false)
        post :create, {:widget => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested widget" do
        widget = Widget.create! valid_attributes
        expect_any_instance_of(Widget).to receive(:update).with({ "name" => "MyString" })
        put :update, {:id => widget.to_param, :widget => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested widget as @widget" do
        widget = Widget.create! valid_attributes
        put :update, {:id => widget.to_param, :widget => valid_attributes}, valid_session
        expect(assigns(:widget)).to eq(widget)
      end

      it "redirects to the widget" do
        widget = Widget.create! valid_attributes
        put :update, {:id => widget.to_param, :widget => valid_attributes}, valid_session
        expect(response).to redirect_to(widget)
      end
    end

    describe "with invalid params" do
      it "assigns the widget as @widget" do
        widget = Widget.create! valid_attributes
        allow_any_instance_of(Widget).to receive(:save).and_return(false)
        put :update, {:id => widget.to_param, :widget => { "name" => "invalid value" }}, valid_session
        expect(assigns(:widget)).to eq(widget)
      end

      it "re-renders the 'edit' template" do
        widget = Widget.create! valid_attributes
        allow_any_instance_of(Widget).to receive(:save).and_return(false)
        put :update, {:id => widget.to_param, :widget => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested widget" do
      widget = Widget.create! valid_attributes
      expect {
        delete :destroy, {:id => widget.to_param}, valid_session
      }.to change(Widget, :count).by(-1)
    end

    it "redirects to the widgets list" do
      widget = Widget.create! valid_attributes
      delete :destroy, {:id => widget.to_param}, valid_session
      expect(response).to redirect_to(widgets_url)
    end
  end
end
