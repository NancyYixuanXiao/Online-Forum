<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Private_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
	<title>Post</title>
	<style>
		.mainDiv {
			top: 150px;
			width: 350px;
			height: 450px;
			background-color: #beeae8;
			border: groove;
			padding: 25px;
			margin: auto;
		}
		.text {
			text-align: left;
			font-family: Lucida Sans Unicode;
			color: #565C5A;
			padding: 12px 16px;
			width: 260px;
			height: 30px;
			margin-left: 30px;
		}
		.button {
			width: 110px; 
			background-color:white; 
			padding: 10px; 
			color: #565C5A; 
			margin-left: 95px; 
			border-radius: 5px; 
			font-size: medium; 
			cursor: pointer;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
	<div class="mainDiv">
		<h2 class="text"> Leave a comment </h2>
		<asp:TextBox ID="TextBoxPost" runat="server" CssClass="text" TextMode="MultiLine" Rows="10" Height="210px"></asp:TextBox>
		<br/><br/>
		<asp:Button ID="Post_button" runat="server" CssClass="button" text="Post" OnClick="Post_click"/>
		<br/>
		<br/>
		<asp:Button ID="Home_button" runat="server" CssClass="button" text="Homepage" OnClick="GoHome"/>
		<br/>
		<asp:Label ID="status" runat="server" style="font-family: Lucida Sans Unicode"></asp:Label>
		<asp:HiddenField ID="HiddenField1" runat="server" />
		<asp:HiddenField ID="HiddenField2" runat="server" />
		<asp:HiddenField ID="HiddenField3" runat="server" />
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" SelectCommand="SELECT * FROM [Posts]" InsertCommand="INSERT INTO Posts(UserName, DateTime, Comment) VALUES ( @user , @time, @comment)">
			<InsertParameters>
				<asp:ControlParameter ControlID="HiddenField1" Name="user" PropertyName="Value" />
				<asp:ControlParameter ControlID="HiddenField2" Name="time" PropertyName="Value" />
				<asp:ControlParameter ControlID="HiddenField3" Name="comment" PropertyName="Value" />
			</InsertParameters>
		</asp:SqlDataSource>
		<br />
		<br />
		<br />
	</div>
	</form>
</body>
</html>
