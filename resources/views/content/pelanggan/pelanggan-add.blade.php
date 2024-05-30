@extends('layouts/layoutMaster')

@section('title', 'Tambah Data Pelanggan')

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
  <span class="text-muted fw-light">Pelanggan /</span><span class="fw-medium">  {{ $mode == 'add' ? 'Tambah' : 'Edit' }} Pelanggan</span>
</h4>

<div class="app-ecommerce">
  <form action="{{ $mode == 'add' ? route('pelanggan.store') : route('pelanggan.update', ['pelanggan' => $pelanggan->id]) }}" method="POST" id="add-pelanggan" enctype="multipart/form-data">
    @csrf
    @if($mode == 'edit')
      @method('PUT')
    @endif
  <!-- Add Product -->
  <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-3">

    <div class="d-flex flex-column justify-content-center">
      <h4 class="mb-1 mt-3"> {{ $mode == 'add' ? 'Tambah' : 'Edit' }} Pelanggan</h4>
    </div>
    <div class="d-flex align-content-center flex-wrap gap-3">
       <button type="submit" class="btn btn-primary">Simpan Pelanggan</button>
    </div>

  </div>

  <div class="row">

    <!-- First column-->
    <div class="col-12">
      <!-- Product Information -->
      <div class="card mb-4">
        <div class="card-header">
          <h5 class="card-tile mb-0">Informasi Pelanggan</h5>
        </div>
        <div class="card-body">
          <div class="mb-3">
            <label class="form-label" for="ecommerce-product-name">Nama</label>
            <input type="text" class="form-control" id="ecommerce-product-name" placeholder="Nama Pelanggan" value="{{ $mode == 'edit' ? $pelanggan->nama : '' }}" name="nama_pelanggan" aria-label="Product title">
          </div>
          <div class="row mb-3">
            <div class="col"><label class="form-label" for="ecommerce-product-sku">Email</label>
              <input type="email" class="form-control" id="ecommerce-product-sku" placeholder="Email" name="email"  value="{{ $mode == 'edit' ? $pelanggan->email : '' }}" aria-label="Email"></div>
            <div class="col"><label class="form-label" for="ecommerce-product-barcode">Nomor Telepon</label>
              <input type="text" class="form-control" id="ecommerce-product-barcode" placeholder="Nomor Telepon" name="nomor_telepon"  value="{{ $mode == 'edit' ? $pelanggan->no_telp : '' }}" aria-label="Nomor Telepon"></div>
          </div>
        </div>
      </div>
      <!-- /Product Information -->
    </div>
    <!-- /Second column -->

  </div>

  </form>
</div>

@endsection
