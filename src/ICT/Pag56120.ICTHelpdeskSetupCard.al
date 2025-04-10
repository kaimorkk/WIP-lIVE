

page 56120 "ICT Helpdesk Setup Card"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk Global Parameters";
    Caption = 'ICT Setup Card';
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group("Global Parameters")
            {
                field("User Feedback Duration"; Rec."User Feedback Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Feedback Duration field.';
                }
                field("Assigned Issue Duration"; Rec."Assigned Issue Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Issue Duration field.';
                }
                field("ICT Email"; Rec."ICT Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Email field.';
                }
                field(Delegate; Rec.Delegate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delegate field.';
                    Visible = false;
                }
            }
            group("Number Series")
            {
                Caption = 'Numbering';
                field("ICT Issuance Voucher Nos."; Rec."ICT Issuance Voucher Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Issuance Voucher Nos. field.';
                }
                field("ICT Helpdesk Nos."; Rec."ICT Helpdesk Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ICT Helpdesk Nos. field.', Comment = '%';
                }
                field("ICT Maintenance Schedule Nos."; Rec."ICT Maintenance Schedule Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Maintenance Schedule Nos. field.';
                }
                field("ICT Inventory Nos"; Rec."ICT Inventory Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Inventory Nos field.';
                }
                field("Project Meeting Register Nos"; Rec."Project Meeting Register Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Meeting Register Nos field.';
                }
                field("ICT Project Nos"; Rec."ICT Project Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Project Nos field.';
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

#pragma implicitwith restore

