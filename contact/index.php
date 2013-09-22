<?php
$title = "Winsomewood - Contact us";
$includes = array('<link rel="stylesheet" type="text/css" href="contact.css" />');
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
	<h2 id="title">Contact us</h2>
	
	<div id="content">
		<p>To contact us, please select one of the following:</p>
		
		<div>
			<span class="large">1.</span>
			<div class="roundedcornerwrapper">
				<div class="top"></div>
				<div class="roundedcornerinner">
					<h3>Submit your comments here</h3>
					<form action="request.php" method="post">
						<fieldset>
						
						<label>Name:<br /><input type="text" name="name" id="name" /></label><br />
						<label>E-mail:<br /><input type="text" name="email" id="email" /></label><br />
						<label>Comments:</label><br />
						<textarea name="comments" rows="7" cols="70"></textarea><br />
						<input type="submit" value="Submit" />
						
						</fieldset>
					</form>
				</div>
				<div class="bottom"></div>
				<div class="spacer"></div>
			</div>
		</div>
		
		<div>
			<span class="large">2.</span>
			<div class="roundedcornerwrapper">
				<div class="top"></div>
				<div class="roundedcornerinner">
					<a href="mailto:info@winsomewood.com"><img src="/images/emailbutton.gif" alt="Email Us at info@winsomewood.com" /></a>
				</div>
				<div class="bottom"></div>
				<div class="spacer"></div>
			</div>
		</div>
				
		<div>
			<span class="large">3.</span>
			<div class="roundedcornerwrapper">
				<div class="top"></div>
				<div class="roundedcornerinner">
					<a href="catalog/"><img src="/images/catalogbutton.gif" alt="Request a Catalog" /></a>
				</div>
				<div class="bottom"></div>
				<div class="spacer"></div>
			</div>
		</div>
		
		<div id="addressdiv">
			<address>
				<strong>USA OFFICE</strong> <a href="http://maps.google.com/maps?q=16111+Woodinville-Redmond+Road+N.E.+Woodinville,+WA+98072-9046,+USA&oe=utf-8&client=firefox-a&hnear=16111+Woodinville+Redmond+Rd+NE,+Woodinville,+Washington+98072&gl=us&t=m&z=16&vpsrc=0" target="_blank">(See Map)</a><br />
				16111 Woodinville-Redmond Road N.E. <br />
				Woodinville, WA 98072-9046, USA <br />
				Phone: 425-483-8888 <br />
				Fax: 425-483-4141
			</address>
			<address>
				<strong>CANADA OFFICE</strong> <a href="http://maps.google.com/maps?q=108-8116+Alexander+Road+Delta,+British+Columbia+V4G+1C6,+Canada&oe=utf-8&client=firefox-a&hnear=8116+Alexander+Rd,+Delta,+Greater+Vancouver+Regional+District,+British+Columbia+V4G+1G7,+Canada&gl=us&t=m&z=16&vpsrc=0" target="_blank">(See Map)</a><br />
				108-8116 Alexander Road <br />
				Delta, British Columbia V4G 1C6, Canada <br />
				Phone: 604-946-5888 <br />
				Fax: 604-946-5899
			</address>
		</div>
		<div class="spacer"></div>
	</div>
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>