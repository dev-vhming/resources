local Translations = {
    error = {
        license_already = 'Người chơi đã có giấy phép!',
        error_license = 'Người chơi không có giấy phép đó',
        no_camera = 'Máy ảnh không tồn tại',
        blood_not_cleared = 'Máu KHÔNG SẠCH',
        bullet_casing_not_removed = 'Vỏ đạn KHÔNG bị loại bỏ',
        none_nearby = 'Không có ai bên cạnh!',
        canceled = 'Đã hủy..',
        time_higher = 'Thời gian phải cao hơn 0',
        amount_higher = 'Số tiền phải cao hơn 0',
        vehicle_cuff = 'Bạn không thể còng tay ai đó trên xe',
        no_cuff = 'Bạn không có còng tay trên người',
        no_impound = 'Không có phương tiện nào bị tạm giữ',
        no_spikestripe = 'Không thể đặt dải nhọn nữa',
        error_license_type = 'Loại giấy phép không hợp lệ',
        rank_license = 'Bạn không phải là cấp bậc đủ cao để cấp giấy phép',
        revoked_license = 'Bạn đã bị thu hồi giấy phép',
        rank_revoke = 'Bạn không phải là cấp bậc đủ cao để thu hồi giấy phép',
        on_duty_police_only = 'Chỉ dành cho cảnh sát đang làm nhiệm vụ',
        vehicle_not_flag = 'Phương tiện không được gắn cờ',
        not_towdriver = 'Không phải là tài xế xe đầu kéo',
        not_lawyer = 'Bạn không phải là luật sư',
        no_anklet = 'Người này không không đeo vòng chân.',
        have_evidence_bag = 'Bạn phải có một túi bằng chứng rỗng bên mình!',
        no_driver_license = 'Không có bằng lái xe',
        not_cuffed_dead = 'Dân thường không bị còng hay chết',
    },
    success = {
        uncuffed = 'Bạn đã được gỡ còng',
        granted_license = 'Bạn đã được cấp giấy phép',
        grant_license = 'Bạn đã cấp giấy phép',
        revoke_license = 'Bạn đã thu hồi giấy phép',
        tow_paid = 'Bạn đã được trả $500',
        blood_clear = 'Làm sạch máu',
        bullet_casing_removed = 'Đã loại bỏ vỏ đạn...!',
        anklet_taken_off = 'Định vị vòng chân của bạn đã tắt',
        took_anklet_from = 'Bạn đã gỡ bỏ trình  %{firstname} %{lastname} theo dõi',
        put_anklet = 'Bạn đeo 1 thiết bị định vị vòng chân',
        put_anklet_on = 'Bạn đã đeo định vị vòng chân trên%{firstname} %{lastname}',
        vehicle_flagged = 'Phương tiện %{plate} đã được định vị cho%{reason}',
        impound_vehicle_removed = 'Phương tiện được đưa ra khỏi bị giam giữ!',
        impounded = 'Phương tiện bị tạm giữ',
 },
    info = {
        mr = 'Mr.',
        mrs = 'Mrs.',
        impound_price = 'Giá mà người chơi phải trả để có được chiếc xe khỏi bị giam giữ (có thể là 0)',
        plate_number = 'Biển số xe',
        flag_reason = 'Lý do gắn cờ xe',
        camera_id = 'Camera ID',
        callsign_name = 'Tên ký hiệu của bạn',
        poobject_object = 'Object type to spawn or \'delete\' to delete',
        player_id = 'ID của người chơi',
        citizen_id = 'Căn cước công dân của người chơi',
        dna_sample = 'Mẫu DNA',
        jail_time = 'Thời gian họ phải ngồi tù',
        jail_time_no = 'Thời gian tù cần phải cao hơn 0',
        license_type = 'Loại giấy phép (lái xe/vũ khí)',
        ankle_location = 'Vị trí vòng chân',
        cuff = 'Bạn bị còng!',
        cuffed_walk = 'Bạn bị còng, nhưng bạn có thể đi bộ',
        vehicle_flagged = 'Xe %{vehicle} được gắn cờ cho: %{reason}',
        unflag_vehicle = 'Xe %{vehicle} không được gắn thẻ',
        tow_driver_paid = 'Bạn đã trả tiền cho tài xế xe kéo',
        paid_lawyer = 'Bạn đã trả tiền cho một luật sư',
        vehicle_taken_depot = 'Xe được đưa vào kho với giá $%{price}',
        vehicle_seized = 'Phương tiện bị thu giữ',
        stolen_money = 'Bạn đã ăn cắp $%{stolen}',
        cash_robbed = 'Bạn đã bị cướp $%{money}',
        driving_license_confiscated = 'Giấy phép lái xe của bạn đã bị tịch thu',
        cash_confiscated = 'Tiền mặt của bạn đã bị tịch thu',
        being_searched = 'Bạn đang được tìm kiếm',
        cash_found = 'Đã tìm thấy $%{cash} trên dân thường',
        sent_jail_for = 'Bạn đã đưa người đó vào tù trong %{time} tháng',
        fine_received = 'Bạn đã nhận được tiền phạt $%{fine}',
        blip_text = 'Cảnh báo cảnh sát - %{value}',
        jail_time_input = 'Thời gian tù',
        submit = 'Nộp',
        time_months = 'Thời gian tính bằng tháng',
        bill = 'Hóa đơn',
        amount = 'Số lượng',
        police_plate = 'LSPD', --Should only be 4 characters long
        vehicle_info = 'Động cơ: %{value} % | Xăng: %{value2} %',
        evidence_stash = 'Kho lưu trữ bằng chứng | %{value}',
        slot = 'Khe số. (1,2,3)',
        current_evidence = '%{value} | Ngăn kéo %{value2}',
        on_duty = '[E] - Go on duty',
        off_duty = '[E] - Go off duty',
        onoff_duty = '~g~On~s~/~r~Off~s~ Duty',
        stash = 'Cất %{value}',
        delete_spike = '[~r~E~s~] Xóa dải nhọn',
        close_camera = 'Đóng Camera',
        bullet_casing = '[~g~G~s~] Vỏ đạn %{value}',
        casing = 'Vỏ đạn',
        blood = 'Máu',
        blood_text = '[~g~G~s~] Máu %{value}',
        fingerprint_text = '[G] Vân tay',
        fingerprint = 'Vân tay',
        store_heli = '[E] Cửa hàng Trực thăng',
        take_heli = '[E] Lấy trực thăng',
        impound_veh = '[E] - Cất phương tiện',
        store_veh = '[E] - Cửa hàng phương tiện',
        armory = 'Kho vũ khí',
        enter_armory = '[E] Kho vũ khí',
        finger_scan = 'Quét vân tay',
        scan_fingerprint = '[E] Quét vân tay',
        trash = 'Rác',
        trash_enter = '[E] Thùng rác',
        stash_enter = '[E] Nhập khóa tủ',
        target_location = 'Vị trí của %{firstname} %{lastname} được đánh dấu trên bản đồ của bạn',
        anklet_location = 'Vị trí vòng chân',
        new_call = 'Cuộc gọi mới',
        officer_down = 'Sếp %{lastname} | %{callsign} tên'
    },
    evidence = {
        red_hands = 'Bàn tay đỏ',
        wide_pupils = 'Mắt thần rộng',
        red_eyes = 'Mắt đỉ',
        weed_smell = 'Có mùi như cỏ dại',
        gunpowder = 'Thuốc súng trong quần áo',
        chemicals = 'mùi hóa chất',
        heavy_breathing = 'Thở nặng nề',
        sweat = 'Ra nhiều mồ hôi',
        handbleed = 'Máu trên tay',
        confused = 'Bối rối',
        alcohol = 'Có mùi như rượu',
        heavy_alcohol = 'Có mùi rất giống rượu',
        agitated = 'Kích động - Dấu hiệu Sử dụng Meth',
        serial_not_visible = 'Số sê-ri không hiển thị ...',
    },
    menu = {
        garage_title = 'Xe cảnh sát',
        close = '⬅ Đóng Menu',
        impound = 'Cất phương tiện',
        pol_impound = 'Kho giam giữ',
        pol_garage = 'Garage cảnh sát',
        pol_armory = 'Giáp cảnh sát',
    },
    email = {
        sender = 'Cơ quan thu thập tư pháp trung ương',
        subject = 'Thu hồi nợ',
        message = 'Thân mến %{value}. %{value2}, <br /><br />Cơ quan thu phí tư pháp trung ương (CJCA) đã tính các khoản tiền phạt mà bạn nhận được từ cảnh sát.<br />There is <strong>$%{value3}</strong> withdrawn from your account.<br /><br />Kind regards,<br />Mr. I.K. Graai',
    },
    commands = {
        place_spike = 'Đặt dải nhọn (Police Only)',
        license_grant = 'Cấp giấy phép cho ai đó',
        license_revoke = 'Thu hồi giấy phép từ ai đó',
        place_object = 'Đặt / Xóa một đối tượng (Police Only)',
        cuff_player = 'Còng người chơi (Police Only)',
        escort = 'Hộ tống người chơi',
        callsign = 'Tự tạo cho mình một dấu hiệu',
        clear_casign = 'Khu vực rõ ràng của vỏ bọc (Police Only)',
        jail_player = 'Nhốt tù người chơi (Police Only)',
        unjail_player = 'Bỏ tù người chơi (Police Only)',
        clearblood = 'Xóa khu vực máu (Police Only)',
        seizecash = 'Thu giữ tiền mặt (Police Only)',
        softcuff = 'Vòng bít mềm (Police Only)',
        camera = 'Xem camera an ninh (Police Only)',
        flagplate = 'Đánh dấu biển số (Police Only)',
        unflagplate = 'Hủy đánh dấu biển số (Police Only)',
        plateinfo = 'Chạy biển số (Police Only)',
        depot = 'Tịch thu xe với giá (Police Only)',
        impound = 'Giam giữ một phương tiện (Police Only)',
        paytow = 'Phí giam giữ xe (Police Only)',
        paylawyer = 'Luật sư trả tiền (Police, Judge Only)',
        anklet = 'Đính kèm vòng đeo chân theo dõi (Police Only)',
        ankletlocation = 'Nhận vị trí của vòng chân của một người',
        removeanklet = 'Loại bỏ vòng đeo chân theo dõi (Police Only)',
        drivinglicense = 'Giành giấy phép lái xe (Police Only)',
        takedna = 'Lấy mẫu DNA từ một người (cần có túi bằng chứng trống)(Police Only)',
        police_report = 'Báo cáo của cảnh sát',
        message_sent = 'Tin nhắn sẽ được gửi đi',
        civilian_call = 'Cuộc gọi dân sự',
        emergency_call = 'Cuộc gọi 911 mới',
        fine = 'Tốt Một Người'
    },
    progressbar = {
        blood_clear = 'Làm sạch máu ...',
        bullet_casing = 'Xóa vỏ đạn ..',
        robbing = 'Lục soát ...',
        place_object = 'Đặt đối tượng ..',
        remove_object = 'Đang xóa đối tượng ..',
        impound = 'Phương tiện gây ấn tượng ..',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
