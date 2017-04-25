class QiniuUploader
  def initialize(parent=Element, selector='.js-qiniu-uploader-container')
    @uploader = parent.find(selector)
    @preview = @uploader.find('.js-uploader-preview')
    @domain = @preview.data('domain')
    @form = @uploader.closest('form')
    init()
  end

  def init
    Qiniu.uploader(
      runtimes: 'html5,flash,html4',
      browse_button: 'pickfiles',
      uptoken: @preview.data('uptoken'),
      domain: @domain,
      max_file_size: '4mb',
      flash_swf_url: @preview.data('flash-url'),
      save_key: true,
      auto_start: true,
      init: {
        FilesAdded: ->(_up, _files) {
          @uploader.find('.js-uploader-progressbar').show()
          @form.find(':submit').prop('disabled', true)
        },
        UploadProgress: ->(up, file) {
          @uploader.find('.js-uploader-progressbar p').text("正在上传文件 #{file.name}, %#{up.total.percent}, 请稍候 ...")
        },
        UploadComplete: ->(_up) {
          uploader.find('.js-uploader-progressbar').hide()
          form.find(':submit').prop('disabled', false)
        },
        FileUploaded: ->(_up, _file, info) {
          key = JSON.parse(info).key
          img = Element(
<<-HEREDOC
<div class="js-image img-container">
  <span class="js-remove-image">
    <i class="fa fa-close"></i>
  </span>
  <img src="#{domain}#{key}?imageView2/1/w/200/h/200"></img>
  <input type="hidden" class="js-image-keys" name="image_keys[]" value="#{key}" />
</div>
HEREDOC
          )
          @uploader.find('.js-uploader-preview').prepend(img).show()
          @form.find('.js-remove-image').on 'click', ->(_e) {
            Document(this).parent.remove
          }
        },
        Error: ->(_up, _error, err_tip) {
          alert("上传出错, 请重试.\n#{err_tip}")
        }
      }
    )
  end
end
