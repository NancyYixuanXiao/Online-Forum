<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
	<title>Online Forum</title>
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
	<div>
		<div class="mainDiv">
			<div class="topBar">
				<h1 class="text" style="text-align:left; color: white"> Online Forum</h1>
				<asp:Panel ID="Panel1" runat="server" style="position: absolute; width: 400px; left: 900px; height: 50px; text-align: center; padding: 5px; top: 23px;">
				<a href="Login.aspx" class="text" style="font-size: large; color:white">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<a href="Register.aspx" class="text" style="font-size: large; color:white">Register</a>
				</asp:Panel>
				<asp:Panel ID="Panel2" runat="server" style="position: absolute; width: 500px; left: 800px; height: 50px; text-align: center; padding: 5px; top: 23px;">
				<h3 class="text" style="color: white; display:inline"> Hello </h3>
				<asp:Label ID="hello" runat="server" Text="user" CssClass="text" style="color: white; font-size:large"></asp:Label>
				<h3 class="text" style="color: white; display:inline"> ! </h3>
				&nbsp; &nbsp; &nbsp;
				<a href="Private/Default.aspx" class="text" style="font-size: large; color:white"> Post</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="Private/MyPosts.aspx" class="text" style="font-size: large; color:white"> My Posts</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:LinkButton ID="logout" runat="server" cssClass="text" style="font-size: large; color:white" OnClick="logout_Click">Logout</asp:LinkButton>
				&nbsp;&nbsp;&nbsp;&nbsp;
				</asp:Panel>
			</div>
		   <div class="subDiv">
			   <h1 class="text"> All Posts </h1>
			   <asp:Table ID="Table1" runat="server" CssClass="table text">
			   </asp:Table>
			   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" SelectCommand="SELECT * FROM [Posts] ORDER BY DateTime DESC"></asp:SqlDataSource>
		   </div>
		   <br />
		   <br />
	   </div>
	</div>
	</form>
	<p class="text">
&nbsp;</p>
</body>
</html>
