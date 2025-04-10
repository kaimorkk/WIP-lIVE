page 96063 "Tender Alerts Cost Activities"
{
    ApplicationArea = All;
    Caption = 'Tender Alerts Cost Activities';
    PageType = CardPart;
    SourceTable = "Tender Alert Activity Cue";
    
    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                Caption = 'Notifications Cost';
                
                field("SMS Cost"; Rec."SMS Cost")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Received Alerts";
                    ToolTip = 'Specifies the value of the SMS Cost field.', Comment = '%';
                }
                field("E-Mail Cost"; Rec."E-Mail Cost")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Received Alerts";
                    ToolTip = 'Specifies the value of the E-Mail Cost field.', Comment = '%';
                }
                field("Notification Cost"; Rec."Notification Cost")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Received Alerts";
                    Caption = 'Total Cost';
                    ToolTip = 'Specifies the value of the Notification Cost field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
