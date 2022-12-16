<!doctype html>
<?php
	session_start();
?>
 <html lang="en">
	<head>
	<meta charset="utf-8" />
	<meta name="developer" content="Sanmitha V S" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0" />
	<link rel="stylesheet" href="../css/ticket.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js" ></script>
<script>
function generatePDF() {
 var doc = new jsPDF(); 
  doc.fromHTML(document.getElementById("ticket"), 
  15,
  15, 
  {
    'width': 170  //set width
  },
  function(a) 
   {
    doc.save("ticket.pdf");
  });
}
</script>
	</head>
	<body>
		<div id="ticket">
			
			<header>
			<img src="../img/jazz.jpg" alt="jazz" id="jazz" />
			<h1><br>Ticket details</h1>
		</header>
		
			<section>
			<table>
			
			<?php
			$name=$_SESSION['name'];
			$em=$_SESSION['email'];
			$m=$_SESSION['slot'];
			$ph=$_SESSION['phone'];
			
			//$db=new mysqli("localhost","root","Sanmitha@33","jazz",3306);
			
			$host        = "host = 127.0.0.1";
			$port        = "port = 5432";
			$dbname      = "dbname =jazz";
			$credentials = "user = postgres password=root";

			$db = pg_connect( "$host $port $dbname $credentials"  );
			
			$res=pg_query($db,"select * from $m where email='$em' and phone='$ph' and name='$name';");
			$r=pg_fetch_all($res);
			//print_r($r);
			echo "<tr><td>Your name : </td><td>$name</td></tr>";
			echo "<tr><td>Your mobile number : </td><td>". ($r[0]['phone']) ."</td></tr>";
			echo "<tr><td>Your email : </td><td>". ($r[0]['email']) ."</td></tr>";
			echo "<tr><td>Slot selected : </td><td>";
			switch($m){
				case "m1s1":
				case "m2s1":
					echo "12:00";
					break;
				case "m1s2":
				case "m2s2":
					echo "15:30";
					break;
				case "m1s3":
				case "m2s3":
					echo "19:00";
					break;
			}
			echo "</td></tr>";
			echo "<tr><td>Selected seats</td><td>";
			foreach($r as $i){
				echo $i['seats'].", ";
			}
			echo "</td></tr>";
			echo "<tr><td>Total amount</td><td>".$_SESSION['amt']."</td></tr>";
			echo "<tr><td></td><td >Paid</td></tr>";
			?>
			</table>
			
			</section>
			
			<footer>
			<h3>Wishing you a wonderful movie experience - Jazz film city</h3>
			</footer>
			
		</div>
		<br><br>
		<a href="javascript:generatePDF()">Download PDF</a>
		<br><br>
		<a href="../index.html" id="ri">Back to home page</a>
	</body>
 </html>