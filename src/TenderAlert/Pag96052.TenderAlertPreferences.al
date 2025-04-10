page 96052 "Tender Alert Preferences"
{
    ApplicationArea = All;
    Caption = 'Tender Alert Preferences';
    PageType = List;
    SourceTable = "Tender Alert Preferences";
    UsageCategory = None;
    // DeleteAllowed = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Preference Type"; Rec."Preference Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preference Type field.', Comment = '%';
                }
                field("Preference Type Name"; Rec."Preference Type Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preference Type Name field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
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
