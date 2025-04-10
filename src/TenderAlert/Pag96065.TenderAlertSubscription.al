page 96065 "Tender Alert Subscription"
{
    ApplicationArea = All;
    Caption = 'Tender Alert Subscription';
    PageType = Document;
    SourceTable = "Tender Alert Subscriptions";
    RefreshOnActivate = true;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Subscription Type"; Rec."Subscription Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subscription Type field.', Comment = '%';
                }
                field("Has Expiry"; Rec."Has Expiry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has Expiry field.', Comment = '%';
                }
                field("Expiry Period"; Rec."Expiry Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Period field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
            }
            part("Subscription Preferences"; "Subscription Preferences")
            {
                ApplicationArea = Basic;
                Caption = 'Preferences';
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance();
    end;

    var
        Preferences: Record "Subscription Preferences";

    local procedure SetControlAppearance()
    begin
        
    end;
}
