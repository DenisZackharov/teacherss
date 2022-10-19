SimpleForm.setup do |config| # rubocop:disable Metrics/BlockLength
  config.button_class = "btn"
  config.boolean_label_class = "form-check-label"
  config.label_text = ->(label, required) { "#{label} #{required}" }
  config.boolean_style = :inline
  config.item_wrapper_tag = :div
  config.include_default_input_wrapper_class = false
  config.error_notification_class = "alert alert-danger"
  config.error_method = :to_sentence
  config.input_field_error_class = "is-invalid"
  config.input_field_valid_class = "is-valid"

  # vertical forms
  #
  # vertical default_wrapper
  config.wrappers :vertical_form, tag: "div", class: "form-group", error_class: "form-group-invalid",
                                  valid_class: "form-group-valid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label
    b.use :input, class: "form-control", error_class: "is-invalid", valid_class: "is-valid"
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # vertical input for boolean
  config.wrappers :vertical_boolean, tag: "fieldset", class: "form-group", error_class: "form-group-invalid",
                                     valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :form_check_wrapper, tag: "div", class: "form-check" do |bb|
      bb.use :input, class: "form-check-input", error_class: "is-invalid", valid_class: "is-valid"
      bb.use :label, class: "form-check-label"
      bb.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback" }
      bb.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
    end
  end

  # vertical input for radio buttons and check boxes
  config.wrappers :vertical_collection, item_wrapper_class: "form-check", item_label_class: "form-check-label",
                                        tag: "fieldset", class: "form-group", error_class: "form-group-invalid",
                                        valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: "legend", class: "col-form-label pt-0" do |ba|
      ba.use :label_text
    end
    b.use :input, class: "form-check-input", error_class: "is-invalid", valid_class: "is-valid"
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # vertical input for inline radio buttons and check boxes
  config.wrappers :vertical_collection_inline, item_wrapper_class: "form-check form-check-inline",
                                               item_label_class: "form-check-label", tag: "fieldset",
                                               class: "form-group", error_class: "form-group-invalid",
                                               valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: "legend", class: "col-form-label pt-0" do |ba|
      ba.use :label_text
    end
    b.use :input, class: "form-check-input", error_class: "is-invalid", valid_class: "is-valid"
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # vertical file input
  config.wrappers :vertical_file, tag: "div", class: "form-group", error_class: "form-group-invalid",
                                  valid_class: "form-group-valid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label
    b.use :input, class: "form-control-file", error_class: "is-invalid", valid_class: "is-valid"
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # vertical multi select
  config.wrappers :vertical_multi_select, tag: "div", class: "form-group", error_class: "form-group-invalid",
                                          valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label
    b.wrapper tag: "div", class: "d-flex flex-row justify-content-between align-items-center" do |ba|
      ba.use :input, class: "form-control mx-1", error_class: "is-invalid", valid_class: "is-valid"
    end
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # vertical range input
  config.wrappers :vertical_range, tag: "div", class: "form-group", error_class: "form-group-invalid",
                                   valid_class: "form-group-valid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly
    b.optional :step
    b.use :label
    b.use :input, class: "form-control-range", error_class: "is-invalid", valid_class: "is-valid"
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # horizontal forms
  #
  # horizontal default_wrapper
  config.wrappers :horizontal_form, tag: "div", class: "form-group row", error_class: "form-group-invalid",
                                    valid_class: "form-group-valid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "col-sm-3 col-form-label"
    b.wrapper :grid_wrapper, tag: "div", class: "col-sm-9" do |ba|
      ba.use :input, class: "form-control", error_class: "is-invalid", valid_class: "is-valid"
      ba.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback" }
      ba.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
    end
  end

  # horizontal input for boolean
  config.wrappers :horizontal_boolean, tag: "div", class: "form-group row", error_class: "form-group-invalid",
                                       valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: "label", class: "col-sm-3" do |ba|
      ba.use :label_text
    end
    b.wrapper :grid_wrapper, tag: "div", class: "col-sm-9" do |wr|
      wr.wrapper :form_check_wrapper, tag: "div", class: "form-check" do |bb|
        bb.use :input, class: "form-check-input", error_class: "is-invalid", valid_class: "is-valid"
        bb.use :label, class: "form-check-label"
        bb.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
        bb.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
      end
    end
  end

  # horizontal input for radio buttons and check boxes
  config.wrappers :horizontal_collection, item_wrapper_class: "form-check", item_label_class: "form-check-label",
                                          tag: "div", class: "form-group row", error_class: "form-group-invalid",
                                          valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "col-sm-3 col-form-label pt-0"
    b.wrapper :grid_wrapper, tag: "div", class: "col-sm-9" do |ba|
      ba.use :input, class: "form-check-input", error_class: "is-invalid", valid_class: "is-valid"
      ba.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
      ba.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
    end
  end

  # horizontal input for inline radio buttons and check boxes
  config.wrappers :horizontal_collection_inline, item_wrapper_class: "form-check form-check-inline",
                                                 item_label_class: "form-check-label", tag: "div",
                                                 class: "form-group row", error_class: "form-group-invalid",
                                                 valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "col-sm-3 col-form-label pt-0"
    b.wrapper :grid_wrapper, tag: "div", class: "col-sm-9" do |ba|
      ba.use :input, class: "form-check-input", error_class: "is-invalid", valid_class: "is-valid"
      ba.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
      ba.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
    end
  end

  # horizontal file input
  config.wrappers :horizontal_file, tag: "div", class: "form-group row", error_class: "form-group-invalid",
                                    valid_class: "form-group-valid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: "col-sm-3 col-form-label"
    b.wrapper :grid_wrapper, tag: "div", class: "col-sm-9" do |ba|
      ba.use :input, error_class: "is-invalid", valid_class: "is-valid"
      ba.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
      ba.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
    end
  end

  # horizontal multi select
  config.wrappers :horizontal_multi_select, tag: "div", class: "form-group row", error_class: "form-group-invalid",
                                            valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "col-sm-3 col-form-label"
    b.wrapper :grid_wrapper, tag: "div", class: "col-sm-9" do |ba|
      ba.wrapper tag: "div", class: "d-flex flex-row justify-content-between align-items-center" do |bb|
        bb.use :input, class: "form-control mx-1", error_class: "is-invalid", valid_class: "is-valid"
      end
      ba.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
      ba.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
    end
  end

  # horizontal range input
  config.wrappers :horizontal_range, tag: "div", class: "form-group row", error_class: "form-group-invalid",
                                     valid_class: "form-group-valid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly
    b.optional :step
    b.use :label, class: "col-sm-3 col-form-label"
    b.wrapper :grid_wrapper, tag: "div", class: "col-sm-9" do |ba|
      ba.use :input, class: "form-control-range", error_class: "is-invalid", valid_class: "is-valid"
      ba.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
      ba.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
    end
  end

  # inline forms
  #
  # inline default_wrapper
  config.wrappers :inline_form, tag: "span", error_class: "form-group-invalid", valid_class: "form-group-valid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "sr-only"

    b.use :input, class: "form-control", error_class: "is-invalid", valid_class: "is-valid"
    b.use :error, wrap_with: { tag: "div", class: "invalid-feedback" }
    b.optional :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # inline input for boolean
  config.wrappers :inline_boolean, tag: "span", class: "form-check mb-2 mr-sm-2", error_class: "form-group-invalid",
                                   valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.use :input, class: "form-check-input", error_class: "is-invalid", valid_class: "is-valid"
    b.use :label, class: "form-check-label"
    b.use :error, wrap_with: { tag: "div", class: "invalid-feedback" }
    b.optional :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # bootstrap custom forms
  #
  # custom input for boolean
  config.wrappers :custom_boolean, tag: "fieldset", class: "form-group", error_class: "form-group-invalid",
                                   valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :form_check_wrapper, tag: "div", class: "custom-control custom-checkbox" do |bb|
      bb.use :input, class: "custom-control-input", error_class: "is-invalid", valid_class: "is-valid"
      bb.use :label, class: "custom-control-label"
      bb.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback" }
      bb.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
    end
  end

  # custom input switch for boolean
  config.wrappers :custom_boolean_switch, tag: "fieldset", class: "form-group", error_class: "form-group-invalid",
                                          valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :form_check_wrapper, tag: "div", class: "custom-control custom-switch" do |bb|
      bb.use :input, class: "custom-control-input", error_class: "is-invalid", valid_class: "is-valid"
      bb.use :label, class: "custom-control-label"
      bb.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback" }
      bb.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
    end
  end

  # custom input for radio buttons and check boxes
  config.wrappers :custom_collection, item_wrapper_class: "custom-control", item_label_class: "custom-control-label",
                                      tag: "fieldset", class: "form-group", error_class: "form-group-invalid",
                                      valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: "legend", class: "col-form-label pt-0" do |ba|
      ba.use :label_text
    end
    b.use :input, class: "custom-control-input", error_class: "is-invalid", valid_class: "is-valid"
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # custom input for inline radio buttons and check boxes
  config.wrappers :custom_collection_inline, item_wrapper_class: "custom-control custom-control-inline",
                                             item_label_class: "custom-control-label",
                                             tag: "fieldset", class: "form-group", error_class: "form-group-invalid",
                                             valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: "legend", class: "col-form-label pt-0" do |ba|
      ba.use :label_text
    end
    b.use :input, class: "custom-control-input", error_class: "is-invalid", valid_class: "is-valid"
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # custom file input
  config.wrappers :custom_file, tag: "div", class: "form-group", error_class: "form-group-invalid",
                                valid_class: "form-group-valid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label
    b.wrapper :custom_file_wrapper, tag: "div", class: "custom-file" do |ba|
      ba.use :input, class: "custom-file-input", error_class: "is-invalid", valid_class: "is-valid"
      ba.use :label, class: "custom-file-label"
      ba.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback" }
    end
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # custom multi select
  config.wrappers :custom_multi_select, tag: "div", class: "form-group", error_class: "form-group-invalid",
                                        valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label
    b.wrapper tag: "div", class: "d-flex flex-row justify-content-between align-items-center" do |ba|
      ba.use :input, class: "custom-select mx-1", error_class: "is-invalid", valid_class: "is-valid"
    end
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # custom range input
  config.wrappers :custom_range, tag: "div", class: "form-group", error_class: "form-group-invalid",
                                 valid_class: "form-group-valid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly
    b.optional :step
    b.use :label
    b.use :input, class: "custom-range", error_class: "is-invalid", valid_class: "is-valid"
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback d-block" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  config.wrappers :floating_labels_form, tag: "div", class: "form-label-group", error_class: "form-group-invalid",
                                         valid_class: "form-group-valid" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :input, class: "form-control", error_class: "is-invalid", valid_class: "is-valid"
    b.use :label
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # custom multi select
  config.wrappers :floating_labels_select, tag: "div", class: "form-label-group", error_class: "form-group-invalid",
                                           valid_class: "form-group-valid" do |b|
    b.use :html5
    b.optional :readonly
    b.use :input, class: "custom-select", error_class: "is-invalid", valid_class: "is-valid"
    b.use :label
    b.use :full_error, wrap_with: { tag: "div", class: "invalid-feedback" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  config.default_wrapper = :vertical_form

  config.wrapper_mappings = {
    boolean: :vertical_boolean,
    check_boxes: :vertical_collection,
    date: :vertical_multi_select,
    datetime: :vertical_multi_select,
    file: :vertical_file,
    radio_buttons: :vertical_collection,
    range: :vertical_range,
    time: :vertical_multi_select
  }
end
