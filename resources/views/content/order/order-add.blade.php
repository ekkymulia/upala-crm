@extends('layouts/layoutMaster')

@section('title', 'Tambah Order')

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
  <span class="text-muted fw-light">Order /</span><span class="fw-medium">  {{ $mode == 'add' ? 'Tambah' : 'Edit' }} Order</span>
</h4>

<div class="app-ecommerce">
  <form action="{{ $mode == 'add' ? route('order.store') : route('order.update', ['order' => $order->id]) }}" method="POST" id="add-order" enctype="multipart/form-data">
    @csrf
    @if($mode == 'edit')
      @method('PUT')
    @endif
  <!-- Add Product -->
  <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-3">

    <div class="d-flex flex-column justify-content-center">
      <h4 class="mb-1 mt-3"> {{ $mode == 'add' ? 'Tambah' : 'Edit' }} Order</h4>
    </div>
    <div class="d-flex align-content-center flex-wrap gap-3">
       <button type="submit" class="btn btn-primary">Simpan Order</button>
    </div>

  </div>

  <div class="row">

    <!-- First column-->
    <div class="col-12 col-lg-8">
      <!-- Product Information -->
      <div class="card mb-4">
        <div class="card-header">
          <h5 class="card-tile mb-0">Informasi Order</h5>
        </div>
        <div class="card-body">
          <div class="row mb-3">
            <div class="col-12 col-lg-7 mb-3">
              <label class="form-label" for="ecommerce-product-name">Produk</label>
              <select id="product-add" class="select2 form-select" data-placeholder="product">
                <option value="">Pilih Produk</option>
                @foreach($produk as $p)
                <option value="{{ $p->id }}">{{ $p->nama }}</option>
                @endforeach
              </select>
            </div>
            <div class="col-12 col-lg-4 mb-3">
              <label class="form-label" for="ecommerce-product-name">Qty</label>
              <input type="number" class="form-control" id="qty-add" placeholder="Quantity"  aria-label="Quantity">
            </div>
          </div>
          <div class="row mb-3">
            <div class="col-12 col-lg-4 mb-3">
              <label class="form-label" for="ecommerce-product-name">Kondisi</label>
              <select id="kondisi-add" class="select2 form-select" data-placeholder="Size">
                <option value="1">Iced</option>
                <option value="2">Hot</option>
              </select>
            </div>
            <div class="col-12 col-lg-4 mb-3">
              <label class="form-label" for="ecommerce-product-name">Level</label>
              <select id="level-add" class="select2 form-select" data-placeholder="Size">
                <option value="1">Sweet</option>
                <option value="2">Regular</option>
              </select>
            </div>
            <div class="col-12 col-lg-4 mb-3 d-flex align-items-end">
              <button type="button" class="btn btn-primary" onclick="addNewPesanan()">+ Tambah Pesanan</button>
            </div>
          </div>
          <hr>
          <table class="table table-responsive table-striped">
            <tr>
              <th>Produk</th>
              <th>Qty</th>
              <th>Kondisi</th>
              <th>Level</th>
              <th></th>
            </tr>
            <tr>
              <td colspan="5" class="text-center">Belum ada Produk</td>
            </tr>
          </table>
      </div>
      <!-- /Product Information -->
      </div>
    </div>

    <!-- /Second column -->
    <div class="col-12 col-lg-4">
      <!-- Variants -->
      <div class="card mb-4">
        <div class="card-header">
          <h5 class="card-title mb-0">Pelanggan</h5>
        </div>
        <div class="card-body">

            <div data-repeater-list="group-a">
              <div data-repeater-item>
                <div class="row">

                  <div class="mb-3 col-12">
                    <label class="form-label" for="form-repeater-1-1">Cari Member</label>
                    <select id="form-repeater-1-1" name="member" class="select2 form-select" data-placeholder="Member">
                      <option value="">Pilih Pelanggan</option>
                      @foreach($pelanggan as $p)
                      <option value="{{ $p->id }}" {{ $mode == 'edit' && $order->pelanggan_id == $p->id ? 'selected' : '' }}>{{ $p->nama }} - {{ $p->no_telp }}</option>
                      @endforeach
                    </select>
                  </div>

                  <!-- <div class="mb-3 col-8">
                    <label class="form-label invisible" for="form-repeater-1-2">Not visible</label>
                    <input type="number" id="form-repeater-1-2" class="form-control" placeholder="Enter size" />
                  </div> -->

                </div>
              </div>
            </div>
            <!-- <div>
              <button class="btn btn-primary" data-repeater-create>
                Add another option
              </button>
            </div> -->
        </div>
      </div>
      <!-- /Variants -->
    <!-- /Second column -->
    </div>
  </form>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script>
  var items = {};

  @if($mode == 'edit')
    var fetched = {!! json_encode($order->order) !!};
    fetched.forEach(function(item){
      items[item.produk_id + '_' + item.condition + '_' + item.level] = {
        product: item.produk_id,
        product_name: item.produk.nama,
        qty: item.qty,
        kondisi: item.condition,
        kondisi_name: item.condition == 1 ? 'Iced' : 'Hot',
        level: item.level,
        level_name: item.level == 1 ? 'Sweet' : 'Regular'
      };
    });

    populateTable();
  @endif

function populateTable(){
  $('table tr').remove(); // Remove existing rows from the table
  
  // Loop through each item in the items array and populate the table
  for (var key in items) {
    if (items.hasOwnProperty(key)) {
      var item = items[key];
      var tableRow = '<tr>' +
                        '<td>' + item.product_name + `
                        <input type="hidden" name="product[]" value="`+item.product+`">
                        <input type="hidden" name="qty[]" value="`+item.qty+`">
                        <input type="hidden" name="kondisi[]" value="`+item.kondisi+`">
                        <input type="hidden" name="level[]" value="`+item.level+`">
                        </td>` +
                        '<td>' + item.qty + '</td>' +
                        '<td>' + item.kondisi_name + '</td>' +
                        '<td>' + item.level_name + '</td>' +
                        // '<td><button onclick="editQty(\'' + key + '\')">Edit Qty</button></td>' +
                        '<td><button class="btn btn-danger" onclick="removeItem(\'' + key + '\')">Hapus</button></td>' +
                    '</tr>';
      $('table').append(tableRow);
    }
  }
}

function addNewPesanan(){
  var product = $('#product-add').val();
  var product_name = $('#product-add option:selected').text();
  var qty = $('#qty-add').val();
  var kondisi = $('#kondisi-add').val();
  var kondisi_name = $('#kondisi-add option:selected').text();
  var level = $('#level-add').val();
  var level_name = $('#level-add option:selected').text();

  if(product == '' || qty == '' || kondisi == '' || level == ''){
    alert('Isikan Seluruh Input Pesanan');
    return;
  }

  var newItemKey = product + '_' + kondisi + '_' + level; // Unique key based on product, kondisi, and level

  // Check if the product is already in the items array
  if (items[newItemKey]) {
    // If it exists, check if kondisi or level is different

    if (items[newItemKey].kondisi !== kondisi || items[newItemKey].level !== level) {
      // If different, create a new item
      items[newItemKey] = {
        product: product,
        product_name: product_name,
        qty: qty,
        kondisi: kondisi,
        kondisi_name: kondisi_name,
        level: level,
        level_name: level_name
      };
    } else {
      // If kondisi and level are the same, update the quantity
      items[newItemKey].qty = parseInt(items[newItemKey].qty) + parseInt(qty);
    }
  } else {
    // If the product does not exist, add it to the items array
    items[newItemKey] = {
      product: product,
      product_name: product_name,
      qty: qty,
      kondisi: kondisi,
      kondisi_name: kondisi_name,
      level: level,
      level_name: level_name
    };
  }

  // Call populateTable to update the table with the new item
  populateTable();
}

function editQty(productId){
  // Assuming you have an input field with id="edit-qty" where the user can enter the new quantity
  var newQty = $('#edit-qty').val();
  items[productId].qty = newQty;
  populateTable(); // Update the table after editing the quantity
}

function removeItem(productId){
  delete items[productId]; // Remove the item from the items array
  populateTable(); // Update the table after removing the item
}
</script>
@endsection
