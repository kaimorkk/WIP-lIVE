page 96062 "Tender Alerts Sent Activities"
{
    ApplicationArea = All;
    Caption = 'Tender Alerts Sent Activities';
    PageType = CardPart;
    SourceTable = "Tender Alert Activity Cue";
    RefreshOnActivate = true;
    ShowFilter = false;
    
    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                Caption = 'Notifications Sent';
                
                field("SMS Sent"; Rec."SMS Sent")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Received Alerts";
                    ToolTip = 'Specifies the value of the SMS Sent field.', Comment = '%';
                }
                field("E-Mail Sent"; Rec."E-Mail Sent")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Received Alerts";
                    ToolTip = 'Specifies the value of the E-Mail Sent field.', Comment = '%';
                }
                field("Notifications Sent"; Rec."Notifications Sent")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Received Alerts";
                    Caption = 'Total Sent';
                    ToolTip = 'Specifies the value of the Notifications Sent field.', Comment = '%';
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
