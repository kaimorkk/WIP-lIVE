
/// <summary>
/// Page Procurement Plan1 (ID 70005).
/// </summary>

page 70005 "Procurement Plan1"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "G/L Budget Name";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Department Filter"; Rec."Department Filter")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000008; "Procurement Plan Items")
            {
                SubPageLink = "Plan Year" = field(Name),
                              "Department Code" = field("Department Filter");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Procurement Plan")
            {
                Caption = 'Procurement Plan';
                action("Request for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Approval';
                    Visible = true;

                    trigger OnAction()
                    begin
                        SendForApproval();
                    end;
                }
                action("<Action1000000041>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Visible = true;

                    trigger OnAction()
                    var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        // IF ApprovalMgt.SendPrcmntPlanApprovalRequest(Rec) THEN;
                    end;
                }
                action("<Action1000000042>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Visible = true;

                    trigger OnAction()
                    var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalMgt.CancelPrcmntPlaApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action("Copy Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Procurement Plan';
                    // RunObject = Report "Rejected Purchase Invoices";
                }
                action("Import Procurement Plan")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Import Procurement Plan";
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("<Action1000000041>_Promoted"; "<Action1000000041>")
                {
                }
                actionref("<Action1000000042>_Promoted"; "<Action1000000042>")
                {
                }
            }
            group(Category_Process)
            {
                actionref("Import Procurement Plan_Promoted"; "Import Procurement Plan")
                {
                }
            }
        }
    }

    var
        Approval: Record "G/L Budget Name";
    //ApprovalMgt: Codeunit "Approvals Mgmt.";


    procedure SendForApproval()
    begin

        if Rec.Status = Rec.Status::New then begin
            Approval.Reset;
            //Approval.SETRANGE(Approval."No.",Rec."No.");
            Rec.Status := Rec.Status::Approved;
            // Rec."Document Type":=Rec."Document Type"::"Approval Form";
            // "Prepared By":=DATABASE.USERID;
            //"Procurement Plan"."Department Code":="G/L Budget Name"."Department Filter" ;
            Rec.Modify;
            Message('Document Successfully sent for Approval');

        end;
    end;
}

#pragma implicitwith restore

