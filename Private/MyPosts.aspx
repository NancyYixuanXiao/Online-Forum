<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyPosts.aspx.cs" Inherits="Private_Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
	<title>My Posts</title>
	<style>
		.mainDiv {
			width: 100%;
			height: 100%;
			top: 0px;
			left: 0px;
			background-color: #E0F7FA;
		}
		.text {
			text-align: center;
			font-family: Lucida Sans Unicode;
			color: #565C5A;
		}
		.topBar {
			width: 100%;
			height: 70px;
			background-color: #00838F;
			top: 0px;
			left: 0px;
			border-bottom: solid white 5px;
		}
		.subDiv {
			width: 80%;
			top: 100px;
			margin: auto;
		}
		.table {
			line-height: 30px;
			left: 60px;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
	<div class="mainDiv">
		<div class="topBar">
				<h1 class="text" style="text-align:left; color: white"> Online Forum</h1>
				<asp:Panel ID="Panel2" runat="server" style="position: absolute; width: 500px; left: 800px; height: 50px; text-align: center; padding: 5px; top: 23px;">
				<h3 class="text" style="color: white; display:inline"> Hello </h3>
				<asp:Label ID="hello" runat="server" Text="user" CssClass="text" style="color: white; font-size:large"></asp:Label>
				<h3 class="text" style="color: white; display:inline"> ! </h3>
				&nbsp; &nbsp; &nbsp;
				<a href="Default.aspx" class="text" style="font-size: large; color:white"> Post</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="../Default.aspx" class="text" style="font-size: large; color:white"> Homepage</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:LinkButton ID="logout" runat="server" cssClass="text" style="font-size: large; color:white" OnClick="logout_Click">Logout</asp:LinkButton>
				&nbsp;&nbsp;&nbsp;&nbsp;
				</asp:Panel>
		 </div>
		<div class="subDiv">
			   <h1 class="text"> My Posts </h1>
			   <asp:Table ID="Table1" runat="server" CssClass="table text">
			   </asp:Table>
			   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" SelectCommand="SELECT Id, UserName, DateTime, Comment FROM Posts WHERE (UserName = @UserName) ORDER BY DateTime DESC">
				   <SelectParameters>
					   <asp:ControlParameter ControlID="HiddenField1" Name="UserName" PropertyName="Value" />
				   </SelectParameters>
			   </asp:SqlDataSource>
				<asp:Label ID="status" runat="server" style="font-family: Lucida Sans Unicode"></asp:Label>
				<br />
		</div>
		<asp:HiddenField ID="HiddenField1" runat="server"/>
		<br />
		<br />
	</div>
	</form>
</body>
</html>
