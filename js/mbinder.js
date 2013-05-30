// Generated by CoffeeScript 1.6.2
(function() {
  var Form1, Validates, ViewClass, _ref, _ref1, _ref2,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  String.prototype.capitalize = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
  };

  Validates = {};

  Validates.Required = (function() {
    function Required() {}

    Required.prototype.valid = function(value) {
      return value !== '' && value;
    };

    return Required;

  })();

  Validates.Email = (function() {
    function Email() {}

    Email.prototype.valid = function(value) {
      return /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test(value);
    };

    return Email;

  })();

  Backbone.Form = (function(_super) {
    __extends(Form, _super);

    function Form() {
      _ref = Form.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Form.prototype.schema = {};

    Form.prototype.defaults = function() {
      var attributes, key;

      attributes = {};
      for (key in this.schema) {
        attributes[key] = this.schema[key]['defaults'] || '';
      }
      return attributes;
    };

    Form.prototype.getValidators = function(key) {
      var validators;

      validators = [];
      if (this.schema[key]) {
        validators = this.schema[key]['validators'];
      }
      return validators;
    };

    return Form;

  })(Backbone.Model);

  Form1 = (function(_super) {
    __extends(Form1, _super);

    function Form1() {
      _ref1 = Form1.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    Form1.prototype.schema = {
      maf_first_name: {
        validators: ['required']
      },
      maf_last_name: {
        validators: ['required']
      },
      maf_email: {
        validators: ['email']
      },
      maf_second_name: {
        validators: ['required']
      },
      maf_mobile_phone: {
        validators: ['required']
      },
      maf_birth_date: {
        validators: ['required']
      },
      maf_accept_rules: {
        validators: ['required']
      }
    };

    return Form1;

  })(Backbone.Form);

  ViewClass = (function(_super) {
    __extends(ViewClass, _super);

    function ViewClass() {
      _ref2 = ViewClass.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    ViewClass.prototype._modelBinder = void 0;

    ViewClass.prototype.events = {
      "click #first_step_submit": "commit"
    };

    ViewClass.prototype.initialize = function() {
      return this._modelBinder = new Backbone.ModelBinder;
    };

    ViewClass.prototype.render = function() {
      this.setElement($(".formBlock1"));
      this._modelBinder.bind(this.model, this.el);
      return this;
    };

    ViewClass.prototype.commit = function() {
      if (this.validate()) {
        console.log('commit');
        return $("#test-content").html(JSON.stringify(model.toJSON()));
      }
    };

    ViewClass.prototype.validate = function() {
      var key, valid;

      valid = true;
      for (key in this.model.attributes) {
        valid = this.validatefield(key) && valid;
      }
      return valid;
    };

    ViewClass.prototype.validatefield = function(key) {
      var valid, validator, validators, value, _i, _len;

      valid = true;
      value = this.model.get(key);
      validators = this.model.getValidators(key);
      for (_i = 0, _len = validators.length; _i < _len; _i++) {
        validator = validators[_i];
        validator = eval("new Validates." + (validator.capitalize()));
        valid && (valid = validator.valid(value));
        if (valid) {
          this.clearError(key);
        } else {
          this.setError(key);
        }
      }
      return valid;
    };

    ViewClass.prototype.setError = function(key) {
      return $("#" + key).parent().addClass('textfieldError');
    };

    ViewClass.prototype.clearError = function(key) {
      return $("#" + key).parent().removeClass('textfieldError');
    };

    return ViewClass;

  })(Backbone.View);

  $(function() {
    var model, view;

    model = new Form1;
    view = new ViewClass({
      model: model
    });
    return console.log(view.render());
  });

}).call(this);
