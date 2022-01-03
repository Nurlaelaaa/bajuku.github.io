<?php
session_start();
include 'koneksi.php';
?>



<!DOCTYPE html>
<html>
<head>
	<title>AUTHENTIC T-SHIRT</title>
	<link rel="stylesheet" href="admin/assets/css/bootstrap.css">
	<style> 
	body {
		background-image: url('images/leaf.png');
	}
	
	.container h1 {
		font-family: Verdana;
		font-weight: bold;
		color: lightblue;
		background-color: white;
		height: 45px;
		width: 330px;

	}
	
	</style>
</head>
<body>

<?php include 'menu.php'; ?>



<section class="konten">
	<div class="container">
	<center><h2>PRODUK TERSEDIA</h2></center>

	<div class="row">

		<?php $ambil=$koneksi->query("SELECT * FROM produk"); ?>
		<?php while ($perproduk=$ambil->fetch_assoc()){ ?>
		
		<div class="col-md-3">
			<div class="thumbnail">
			<img src="foto_produk/<?php echo $perproduk['foto_produk']; ?>" alt="">
			<div class="caption">
				<h3><?php echo $perproduk['nama_produk'];?></h3>
				<h5>Rp. <?php echo number_format($perproduk['harga_produk']);?></h5>
				<a href="beli.php?id=<?php echo $perproduk['id_produk'];?>" 
				class="btn btn-primary">Beli</a>
				<a href="detail.php?id=<?php echo $perproduk["id_produk"];?>" class="btn btn-default">Detail</a>
			</div>
			</div>
		</div>
		<?php } ?>
	</div>
	</div>
</section>

</body>
</html>