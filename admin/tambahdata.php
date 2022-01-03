 <?php
$tambahdata=array();
$ambil=$koneksi->query("SELECT * FROM kategori");
while($tiap=$ambil->fetch_assoc())
{
	$tambahdata[]=$tiap;
}
 echo "<pre>";
 print_r($tambahdata);
 echo "</pre>";

?>

  
<h2>Tambah Data</h2>

<form method="post" enctype="multipart/form-data">

	
	<div class="form-group">
		<label>No</label>
		<input type="number" class="form-control" name="no">
	</div>
	<div class="form-group">
		<label>Kategori</label>
		<input type="text" class="form-control" name="kategori">
	</div>
	<button class="btn btn-primary" name="save">Simpan</button>
</form>
<?php
if (isset($_POST['save']))
{

	
	 $koneksi->query("INSERT INTO Data(no_data,kategori_data)
	 VALUES('$_POST[no]','$_POST[kategori]')");


	

	echo"<div class='alert alert-info'>Data tersimpan</div>";
	echo"<meta http-equiv='refresh' content='1;url=index.php?halaman=kategori'>";


}
?>


