

page 75229 "BoQ Item Categories"
{
    ApplicationArea = Basic, Suite;
    Caption = 'BoQ Item Categories';
    CardPageID = "Item Category Card";
    // InsertAllowed = false;
    PageType = List;
    RefreshOnActivate = true;
    // ShowFilter = false;
    SourceTable = "Item Category";
    deleteallowed = true;
    // SourceTableView = sorting("Presentation Order")
    //                   where("Bill Item Group" = const(true));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                //IndentationColumn = Indentation;
                IndentationControls = "Code";
                ShowAsTree = true;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic, Suite;
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the code for the item category.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(false);
                        CurrPage.ItemAttributesFactbox.Page.LoadCategoryAttributesData(Rec.Code);
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a description of the item category.';
                }
            }
        }
        area(factboxes)
        {
            part(ItemAttributesFactbox; "Item Attributes Factbox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Attributes';
            }
        }
    }

    actions
    {
        area(creation)
        {
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        StyleTxt := Rec.GetStyleText;
        CurrPage.ItemAttributesFactbox.Page.LoadCategoryAttributesData(Rec.Code);
    end;

    trigger OnAfterGetRecord()
    begin
        StyleTxt := Rec.GetStyleText;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        StyleTxt := Rec.GetStyleText;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        StyleTxt := Rec.GetStyleText;
    end;

    trigger OnOpenPage()
    var
        ItemCategoryManagement: Codeunit "Item Category Management";
    begin
        ItemCategoryManagement.UpdatePresentationOrder;
    end;

    var
        StyleTxt: Text;

    procedure GetSelectionFilter(): Text
    var
        ItemCategory: Record "Item Category";
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(ItemCategory);
        exit(SelectionFilterManagement.GetSelectionFilterForItemCategory(ItemCategory));
    end;

    procedure SetSelection(var ItemCategory: Record "Item Category")
    begin
        CurrPage.SetSelectionFilter(ItemCategory);
    end;
}

#pragma implicitwith restore

