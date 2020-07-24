<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sample.aspx.cs" Inherits="Sample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<form id="form1" runat="server">  
    <div style="width:100%;">  
        <fieldset style="width:40%;">  
            <legend>Comsatel Advanced ToDo</legend>  
            <table style="width:100%;">  
                <tr>  
                    <td>Descripcion</td>  
                    <td>  
                        <asp:TextBox ID="txtDescripcion" runat="server" ></asp:TextBox>  
                    </td>  
                </tr>  
                 <tr>  
                    <td>Estado</td>  
                    <td>  
                        <asp:TextBox ID="txtEstado" runat="server"  ></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td></td>  
                    <td class="style1">  
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />  
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />  
                    </td>  
                </tr>  
                <tr>  
                    <td colspan="2">  
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>  
                    </td>  
                </tr>  
                <tr>  
                    <td colspan="2">  
                        <br />  
                    </td>  
                </tr>  
                <tr>  
                    <td colspan="2">  
                        <asp:GridView ID="grdTareas" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"  
CellPadding="5" Width="100%">  
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />  
                            <Columns>
                                <asp:TemplateField HeaderText="Descripcion">  
                                    <ItemTemplate>  
                                        <asp:Label ID="lblDescripcion" runat="server" Text='<%#Eval("descripcion") %>'>  
                                        </asp:Label>
                                        <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id")%>'>  
                                        </asp:Label>                                         
                                    </ItemTemplate>  
                                </asp:TemplateField>                                
                                <asp:TemplateField HeaderText="Estado">  
                                    <ItemTemplate>  
                                        <asp:Label ID="lblEstado" runat="server" Text='<%#Eval("estado") %>'>  
                                        </asp:Label>  
                                    </ItemTemplate>  
                                </asp:TemplateField>    
                                <asp:TemplateField HeaderText="Edit">  
                                    <ItemTemplate>  
                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CausesValidation="false"  
CommandArgument=' <%#Eval("Id") %>' OnCommand="lnkEdit_Command" ToolTip="Edit" />  
                                        </ItemTemplate>  
                                    </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Delete">  
                                        <ItemTemplate>  
                                            <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CausesValidation="false"  
  
CommandArgument='  
                                                <%#Eval("Id") %>' CommandName="Delete" OnCommand="lnkDelete_Command"  
  
OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete" />  
                                            </ItemTemplate>  
                                        </asp:TemplateField>  
                                    </Columns>  
                                </asp:GridView>  
                            </td>  
                        </tr>  
                </table>  
        </fieldset>  
    </div>  
</form>  
</body>
</html>
