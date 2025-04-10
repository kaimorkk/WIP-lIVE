page 96066 "Subscription Preferences"
{
    ApplicationArea = All;
    Caption = 'Subscription Preferences';
    PageType = ListPart;
    SourceTable = "Subscription Preferences";
    PopulateAllFields = true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Preference Code"; Rec."Preference Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preference Code field.', Comment = '%';
                }
                field("Preference Name"; Rec."Preference Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Preference Name field.', Comment = '%';
                }
                field("Preference Type"; Rec."Preference Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Preference Type field.', Comment = '%';
                }
                field("Preference Type Name"; Rec."Preference Type Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Preference Type Name field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        
    end;

    trigger OnAfterGetRecord()
    begin

    end;

    trigger OnOpenPage()
    begin

    end;
}
