<link href="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.css" rel="stylesheet">

<script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.22.1/dist/extensions/filter-control/bootstrap-table-filter-control.min.js"></script>

<table
  id="table"
  data-url="json/data1.json"
  data-filter-control="true"
  data-show-search-clear-button="true">
  <thead>
    <tr>
      <th data-field="id">ID</th>
      <th data-field="name" data-filter-control="input">Item Name</th>
      <th data-field="price" data-filter-control="select">Item Price</th>
    </tr>
  </thead>
</table>

<script>
  $(function() {
    $('#table').bootstrapTable()
  })
</script>