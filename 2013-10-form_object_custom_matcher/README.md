In Rails app

Created custom matcher for [form_objects](http://railscasts.com/episodes/416-form-objects),
however I dumped this code after refactor. 

Usage was something like this: 

    it{ document_form.should be_able_to_set_param(:document_name_id).on(:document) }
    it{ document_form.should be_able_to_set_param(:document_name_id).on(:document_content, :content) }
