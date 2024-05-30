@extends('layouts/layoutMaster')

@section('title', 'Tambah Data Karyawan')

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
  <span class="text-muted fw-light">Karyawan /</span><span class="fw-medium">  {{ $mode == 'add' ? 'Tambah' : 'Edit' }} Karyawan</span>
</h4>

<div class="app-ecommerce">
  <form action="{{ $mode == 'add' ? route('karyawan.store') : route('karyawan.update', ['karyawan' => $karyawan->id]) }}" method="POST" id="add-karyawan" enctype="multipart/form-data">
    @csrf
    @if($mode == 'edit')
      @method('PUT')
    @endif
  <!-- Add Product -->
  <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-3">

    <div class="d-flex flex-column justify-content-center">
      <h4 class="mb-1 mt-3"> {{ $mode == 'add' ? 'Tambah' : 'Edit' }} Karyawan</h4>
    </div>
    <div class="d-flex align-content-center flex-wrap gap-3">
       <button type="submit" class="btn btn-primary">Simpan Karyawan</button>
    </div>

  </div>

  <div class="row">

    <!-- First column-->
    <div class="col-12">
      <!-- Product Information -->
      <div class="card mb-4">
        <div class="card-header">
          <h5 class="card-tile mb-0">Informasi Karyawan</h5>
        </div>
        <div class="card-body">
          <div class="mb-3">
            <label class="form-label" for="ecommerce-product-name">Nama</label>
            <input type="text" class="form-control" id="ecommerce-product-name" placeholder="Nama Karyawan" value="{{ $mode == 'edit' ? $karyawan->name : '' }}" name="nama_karyawan" aria-label="Nama Karyawan">
          </div>
          <div class="row mb-3">
            <div class="col"><label class="form-label" for="ecommerce-product-sku">Email</label>
              <input type="email" class="form-control" id="ecommerce-product-sku" placeholder="Email" name="email"  value="{{ $mode == 'edit' ? $karyawan->email : '' }}" aria-label="Email"></div>
            <div class="col"><label class="form-label" for="ecommerce-product-barcode">Password</label>
              <input type="text" class="form-control" id="ecommerce-product-barcode" placeholder="Password" name="password"  aria-label="Password"></div>
              <div class="col"><label class="form-label" for="ecommerce-product-barcode">Role</label>
              <select id="form-repeater-1-1" name="role" class="select2 form-select" data-placeholder="Pilih Role">
                  <option value="">Pilih Role</option>
                  @foreach($role as $r)
                  <option value="{{ $r->id }}" {{ $mode == 'edit' && $r->id == $karyawan->role_id ? 'selected' : '' }}>{{ $r->nama }}</option>
                  @endforeach
              </select>
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
