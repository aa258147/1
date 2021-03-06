module Policr
  commander From do
    alias From = Model::From

    def handle(msg, from_nav)
      reply_menu do
        sended_msg = create_menu({
          text:         paste_text,
          reply_markup: paste_markup,
        })
        if sended_msg
          Cache.carving_from_setting_msg _chat_id, sended_msg.message_id
        end

        sended_msg
      end
    end

    SELECTED   = "■"
    UNSELECTED = "□"

    def_markup do
      selected_status = From.enabled?(_group_id) ? SELECTED : UNSELECTED
      text = selected_status + " " + t("from.enable")
      _markup << [Button.new(text: text, callback_data: "FromSetting:enable:toggle")]
    end

    def_text do
      from_text =
        if (from = From.find_by_chat_id _group_id) && (list = from.gen_list)
          String.build do |str|
            list.each_with_index do |ls, i|
              str << ls.join(" | ")
              str << "\n" if i < (list.size - 1)
            end
          end
        else
          t "from.none"
        end
      t "from.desc", {from_text: from_text}
    end
  end
end
