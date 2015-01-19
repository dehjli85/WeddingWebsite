function profileSelector(textDiv){

	this.textDiv = $('#' + textDiv);
	this.htmlTexts = new Array();
	this.profileDivs = new Array();
}

profileSelector.prototype.changeTextAndPicture = function(index) {
	this.textDiv.html(this.htmlTexts[index]);
	for(var i = 0; i < this.profileDivs.length; i++){
		if(i != index)	
			this.profileDivs[i].css({ opacity: 0.25 });
		else
			this.profileDivs[i].css({ opacity: 1 });	
	}
	
};


/*
*	<div>
*		<a><img></a>
*		<div>
*			<h4></h4>
*			<p><b></b></p>
*		</div>
*	</div>
*
*/
profileSelector.prototype.addProfile = function(profileDiv, htmlText) {
	var $profileDiv = $('#' + profileDiv);

	var header = '<h3>In their own words...</h3>';

	this.profileDivs.push($profileDiv);
	this.htmlTexts.push(header + htmlText);

	var obj = this;
	var index = this.profileDivs.length-1;
	
	var newProfileDiv = this.profileDivs[index];
	console.log(newProfileDiv);


	$( newProfileDiv.children()[0] ).click( 
		function () {
			obj.changeTextAndPicture(index);			
			return false;
		}
	);
};