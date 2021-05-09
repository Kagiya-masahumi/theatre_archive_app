class Top < ApplicationRecord
  mount_uploader :video_top, VideoUploader
  #mount_uploader [:カラム名], [アップローダークラス]
end
