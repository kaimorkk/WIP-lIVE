

page 69470 "Safety Equipment Registers"
{
    CardPageID = "Safety Equipment Register";
    PageType = List;
    SourceTable = "Safety Equipment Register";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = Basic;
                }
                field(SubType; Rec.SubType)
                {
                    ApplicationArea = Basic;
                }
                field("SubType No."; Rec."SubType No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Implementing Unit Code"; Rec."Implementing Unit Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implementing Unit field.';
                }
                field("Implementing Unit Name"; Rec."Implementing Unit Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implementing Unit Name field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Safety Equipment Category"; Rec."Safety Equipment Category")
                {
                    ApplicationArea = Basic;
                }
                field("Safety Notes/Comments"; Rec."Safety Notes/Comments")
                {
                    ApplicationArea = Basic;
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Inventory Quantity"; Rec."Inventory Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Used Quantity"; Rec."Used Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Used Quantity field.';
                }
               
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

