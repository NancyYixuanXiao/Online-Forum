<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="Private_Modify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
	<title>Modify Post</title>
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
		<h2 class="text"> Modify a comment </h2>
		<asp:TextBox ID="TextBoxPost" runat="server" CssClass="text" TextMode="MultiLine" Rows="10" Height="210px"></asp:TextBox>
		<br/><br/>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" SelectCommand="SELECT * FROM [Posts] WHERE ([Id] = @Id)" UpdateCommand="UPDATE Posts SET DateTime = @time, Comment = @comment WHERE (Id = @id)">
			<SelectParameters>
				<asp:ControlParameter ControlID="HiddenField4" Name="Id" PropertyName="Value" Type="Int32" />
			</SelectParameters>
			<UpdateParameters>
				<asp:ControlParameter ControlID="HiddenField2" Name="time" PropertyName="Value" />
				<asp:ControlParameter ControlID="HiddenField3" Name="comment" PropertyName="Value" />
				<asp:ControlParameter ControlID="HiddenField4" Name="id" PropertyName="Value" />
			</UpdateParameters>
		</asp:SqlDataSource>
		<asp:Button ID="Modify_button" runat="server" CssClass="button" text="Modify" OnClick="Modify_click"/>
		<br/>
		<br/>
		<asp:Button ID="MyPost_button" runat="server" CssClass="button" text="My Posts" OnClick="goMyPosts"/>
		<br/>
		<asp:Label ID="status" runat="server" style="font-family: Lucida Sans Unicode"></asp:Label>
		<asp:HiddenField ID="HiddenField2" runat="server" />
		<asp:HiddenField ID="HiddenField3" runat="server" />
		<asp:HiddenField ID="HiddenField4" runat="server"/>
		
		<br />
		<br />
		<br />
	</div>
	</form>
</body>
</html>
