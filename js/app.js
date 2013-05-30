// Generated by CoffeeScript 1.6.2
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  $(function() {
    var User, form, user, _ref, _ref1;

    Backbone.Form.editors.TbText = (function(_super) {
      __extends(TbText, _super);

      function TbText() {
        _ref = TbText.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      TbText.prototype.initialize = function(options) {
        return console.log(this);
      };

      return TbText;

    })(Backbone.Form.editors.Text);
    User = (function(_super) {
      __extends(User, _super);

      function User() {
        _ref1 = User.__super__.constructor.apply(this, arguments);
        return _ref1;
      }

      User.prototype.schema = {
        maf_last_name: {
          type: 'Text',
          validators: ['required']
        },
        maf_email: {
          type: 'Text',
          validators: ['email', 'required']
        }
      };

      return User;

    })(Backbone.Model);
    user = new User({
      maf_last_name: 'Sterling',
      maf_email: 'sterlingi@sis.com'
    });
    user.bind("change", function() {
      return console.log("Model has been changed!");
    });
    console.log(_.template($('#form_block_1').html()));
    form = new Backbone.Form({
      template: _.template($('#form_block_1').html()),
      model: user
    });
    console.log(form.el);
    return $(".block_bg").append(form.render().el);
  });

}).call(this);
