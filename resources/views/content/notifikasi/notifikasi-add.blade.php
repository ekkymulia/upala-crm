@extends('layouts/layoutMaster')

@section('title', 'Tambah Notifikasi')

@section('vendor-style')
@vite([
  'resources/assets/vendor/libs/quill/typography.scss',
  'resources/assets/vendor/libs/quill/katex.scss',
  'resources/assets/vendor/libs/quill/editor.scss',
  'resources/assets/vendor/libs/select2/select2.scss',
  'resources/assets/vendor/libs/dropzone/dropzone.scss',
  'resources/assets/vendor/libs/flatpickr/flatpickr.scss',
  'resources/assets/vendor/libs/tagify/tagify.scss'
])
@endsection

@section('vendor-script')
@vite([
  'resources/assets/vendor/libs/quill/katex.js',
  'resources/assets/vendor/libs/quill/quill.js',
  'resources/assets/vendor/libs/select2/select2.js',
  'resources/assets/vendor/libs/dropzone/dropzone.js',
  'resources/assets/vendor/libs/jquery-repeater/jquery-repeater.js',
  'resources/assets/vendor/libs/flatpickr/flatpickr.js',
  'resources/assets/vendor/libs/tagify/tagify.js'
])
@endsection

@section('page-script')
@vite([
  'resources/assets/js/app-ecommerce-product-add.js'
])
@endsection

@section('content')
<h4 class="py-3 mb-0">
  <span class="text-muted fw-light">Notifikasi /</span><span class="fw-medium">  {{ $mode == 'add' ? 'Tambah' : 'Edit' }} Notifikasi</span>
</h4>

<div class="app-ecommerce">
  <form action="{{ $mode == 'add' ? route('notifikasi.store') : route('notifikasi.update', ['notifikasi' => $notifikasi->id]) }}" method="POST" id="add-notifikasi" enctype="multipart/form-data">
    @csrf
    @if($mode == 'edit')
      @method('PUT')
    @endif
  <!-- Add Product -->
  <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-3">

    <div class="d-flex flex-column justify-content-center">
      <h4 class="mb-1 mt-3"> {{ $mode == 'add' ? 'Tambah' : 'Edit' }} Notifikasi</h4>
    </div>
    <div class="d-flex align-content-center flex-wrap gap-3">
       <button type="submit" class="btn btn-primary">Simpan Notifikasi</button>
    </div>

  </div>

  <div class="row">

    <!-- First column-->
    <div class="col-12">
      <!-- Product Information -->
      <div class="card mb-4">
        <div class="card-header">
          <h5 class="card-tile mb-0">Informasi Notifikasi</h5>
        </div>
        <div class="card-body">
          <div class="mb-3">
            <label class="form-label" for="ecommerce-product-name">Subject</label>
            <input type="text" class="form-control" id="ecommerce-product-name" placeholder="Subject" value="{{ $mode == 'edit' ? $notifikasi->title : '' }}" name="title" aria-label="Subject">
          </div>
          <div>
            <label class="form-label">Content</label>
            <div class="form-control p-0 pt-1">
              <div class=" border-0 border-bottom">
               
              </div>
              <div class=" border-0 pb-4" id="ecommerce-category-description">
              </div>

            </div>
          </div>
          <div class="row mb-3">
            <div class="mb-3 col-12">
              <label class="form-label" for="form-repeater-1-1">Tipe Notifikasi</label>
              <select id="form-repeater-1-1" name="notification_type" class="select2 form-select" data-placeholder="Size">
                <option value="1" {{ $mode == 'edit' && $notifikasi->notification_type == '1' ? 'selected' : '' }}>Promosi</option>
                <option value="2" {{ $mode == 'edit' && $notifikasi->notification_type == '2' ? 'selected' : '' }}>Newsletter</option>
              </select>
            </div>

            <div class="col"><label class="form-label" for="ecommerce-product-barcode">Media Attachment</label><br>
              @if($mode == 'edit')
              <span>Media attachment</span> <br>
              <img src="{{ asset('storage/notifikasi/'.$notifikasi->media_attachment) }}" alt="Media Attachment" style="width: 130px; height: 100px;"><br>
              <br>
              <span>Ganti Media:</span> <br>
              @endif
              <input name="file" type="file" />
          </div>
        </div>
      </div>
      <!-- /Product Information -->
    </div>
    <!-- /Second column -->

  </div>

  </form>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
  $(document).ready(function(){
    $("#add-notifikasi").on("submit", function () {
      var hvalue = $('.ql-editor').html();
      $(this).append("<textarea name='content' style='display:none'>"+hvalue+"</textarea>");
    });

    var quill = new Quill('#ecommerce-category-description', {
      theme: 'snow',
      modules: {
        toolbar: [
          [{ header: [1, 2, false] }],
          ['bold', 'italic', 'underline'],
        ],
      },
    });
    @if($mode == 'edit')

    quill.root.innerHTML = `{!! $notifikasi->message !!}`;
    @endif
  });

</script>
@endsection
