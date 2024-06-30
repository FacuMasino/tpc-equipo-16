﻿<%@ Page Title="Productos Destacados" Language="C#" MasterPageFile="~/Admin/AdminMP.Master"
    AutoEventWireup="true" CodeBehind="Featureds.aspx.cs" Inherits="WebForms.Admin.Featureds" %>

<asp:Content ID="FeaturedsContent" ContentPlaceHolderID="BodyPlaceHolder" runat="server">
    <div class="d-flex flex-column container-800 mx-auto gap-3">
        <div>
            <h1 class="fs-4">Destacados</h1>
            <p>
                Agregue hasta 6 productos para que aparezcan como destacados en el encabezado principal
                de la tienda
            </p>
        </div>

        <div class="table-responsive card">
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th scope="col">Producto</th>
                        <th scope="col">Categoría</th>
                        <th scope="col">Mostrar como nuevo</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="FeaturedsListRepeater">
                        <ItemTemplate>
                            <tr>
                                <th scope="row">
                                    <img src="<%#Eval("Images[0].Url")%>" class="img-table" />
                                    <a class="text-black"
                                        href="/Product.aspx?id=<%#Eval("Id")%>"
                                        target="_blank">
                                        <%#Eval("Brand")%> - <%#Eval("name")%>
                                    </a>
                                </th>
                                <td class="align-middle" title="<%#Helper.GetCategoriesList((List<Category>)Eval("Categories"))%>">
                                    <%#Eval("Categories[0]")%>
                                    <%#Helper.PrintCategoriesCount(Eval("Categories"))%>
                                </td>
                                <td class="align-middle">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="newProductChk">
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <div class="d-flex gap-2">
                                        <!-- Subir orden -->
                                        <asp:LinkButton Text='<i class="bi bi-caret-up-fill"></i>'
                                            CssClass="p-0 text-black fs-5"
                                            CommandArgument='<%#Eval("Id")%>'
                                            ID="LevelUpLnkBtn"
                                            OnClick="LevelUpLnkBtn_Click"
                                            runat="server"
                                            title="Subir" />
                                        <!-- Bajar orden -->
                                        <asp:LinkButton Text='<i class="bi bi-caret-down-fill"></i>'
                                            CssClass="p-0 text-black fs-5"
                                            CommandArgument='<%#Eval("Id")%>'
                                            ID="LevelDownLnkBtn"
                                            OnClick="LevelDownLnkBtn_Click"
                                            runat="server"
                                            title="Bajar" />
                                        <!-- Quitar-->
                                        <asp:LinkButton Text='<i class="bi bi-trash3"></i>'
                                            CssClass="p-0 text-black fs-5"
                                            CommandArgument='<%#Eval("Id")%>'
                                            ID="deleteFeaturedLnkBtn"
                                            OnClick="deleteFeaturedLnkBtn_Click"
                                            runat="server"
                                            title="Quitar" />
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>

            </table>
        </div>

        <!-- Lista de productos -->
        <div>
            <a class="px-2 py-2 nav-link fw-500 text-reset rounded-top border-bottom d-flex justify-content-between bg-body-secondary"
                data-bs-toggle="collapse" href="#productsCollapse" aria-expanded="true">Agregar
                Producto
            <i class="bi bi-caret-down-fill"></i>
            </a>
            <div class="collapse border rounded-bottom p-3" id="productsCollapse">
                <!-- BUSCADOR -->
                <asp:Panel ID="SearchPanel" runat="server" CssClass="input-group mb-3" DefaultButton="searchBtn">
                    <asp:TextBox CssClass="form-control" ID="SearchTextBox" runat="server" Text="" placeholder="Buscar por nombre, marca, etc" />
                    <asp:LinkButton Text='<i class="bi bi-search"></i>' ID="SearchBtn" CssClass="btn rounded-end btn-outline-secondary"
                        runat="server" OnClick="SearchBtn_Click" />
                    <div class="invalid-feedback">
                        Ingrese al menos 2 caracteres.    
                    </div>
                </asp:Panel>
                <!-- Listado -->
                <div class="table-responsive card">
                    <table class="table table-hover">
                        <thead class="table-light">
                            <tr>
                                <th scope="col">Producto</th>
                                <th scope="col">Categoría</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Stock</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="ProductListRepeater">
                                <ItemTemplate>
                                    <tr>
                                        <th scope="row">
                                            <a class="text-black"
                                                href="/Product.aspx?id=<%#Eval("Id")%>"
                                                target="_blank">
                                                <%#Eval("Brand")%> - <%#Eval("name")%>
                                            </a>
                                        </th>
                                        <td title="<%#Helper.GetCategoriesList((List<Category>)Eval("Categories"))%>">
                                            <%#Eval("Categories[0]")%>
                                            <%#Helper.PrintCategoriesCount(Eval("Categories"))%>
                                        </td>
                                        <td>$ <%#Eval("Price")%></td>
                                        <td><%#Eval("Stock")%></td>
                                        <td>
                                            <div class="d-flex gap-2">
                                                <!-- Agregar -->
                                                <asp:LinkButton Text='<i class="bi bi-plus-square-fill"></i>'
                                                    CssClass="p-0 text-black fs-5"
                                                    CommandArgument='<%#Eval("Id")%>'
                                                    ID="AddProductLnkBtn"
                                                    OnClick="AddProductLnkBtn_Click"
                                                    runat="server" />
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>

    </div>
</asp:Content>