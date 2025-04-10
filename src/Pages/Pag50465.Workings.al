page 50465 Workings
{
    Caption = 'Workings';
    PageType = ListPart;
    SourceTable = "Workplan Workings";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Type field.', Comment = '%';
                }
                field("Account Type"; Rec."Item No")
                {
                    ApplicationArea = All;
                    Editable = Rec.Type = Rec.Type::Procurable;
                    ToolTip = 'Specifies the value of the Account Type field.', Comment = '%';
                }
                field(itemNo; Rec."Item No"){
                    visible= false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }

                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Cost field.', Comment = '%';
                }
                
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure field.', Comment = '%';
                }
                
                field("Q1 Quantity"; Rec."Q1 Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q1 Quantity field.', Comment = '%';
                }
                field("Q1 Amount"; Rec."Q1 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q1 Amount field.', Comment = '%';
                }
                field("Q2 Quantity"; Rec."Q2 Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q2 Quantity field.', Comment = '%';
                }
                field("Q2 Amount"; Rec."Q2 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q2 Amount field.', Comment = '%';
                }
                field("Q3 Quantity"; Rec."Q3 Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q3 Quantity field.', Comment = '%';
                }
                field("Q3 Amount"; Rec."Q3 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q3 Amount field.', Comment = '%';
                }
                field("Q4 Quantity"; Rec."Q4 Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q4 Quantity field.', Comment = '%';
                }
                field("Q4 Amount"; Rec."Q4 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q4 Amount field.', Comment = '%';
                }
                field(Unit; Rec.Unit)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit field.', Comment = '%';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    visible = false;
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        Header: Record "Annual Strategy Workplan";
    begin
        Header.Reset();
        Header.SetRange(No, Rec.GetFilter("Strategy Plan ID"));
        if Header.FindFirst() then begin
            if Header."Approval Status" <> Header."Approval Status"::Open then
                CurrPage.Editable := false;
        end;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
//if Confirm('Do you want to update the budget amounts with the amounts in the workings') then
        //Rec.UpdateBudgetLine();
    end;
}
