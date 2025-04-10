page 69570 "Approved Transfer Requests"
{
    Caption = 'Approved Transfer Requests';

    PageType = Card;
    SourceTable = "Employee Transfers";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';


                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Transfer Appeal"; Rec."Transfer Appeal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Appeal field.';
                }
                field("Original Station"; Rec."Original Station")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Original Station field.';
                }
                field("Original Station Name"; Rec."Original Station Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Original Station Name field.';
                }
                field("Suggested Station 1"; Rec."Suggested Station 1")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Preferred Station 1 field.';
                }
                field("Suggested Station 1 Name"; Rec."Suggested Station 1 Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Preferred Station 1 Name field.';
                }
                field("Suggested Station 2"; Rec."Suggested Station 2")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Preferred Station 2 field.';
                }
                field("Suggested Station 2 Name"; Rec."Suggested Station 2 Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Preferred Station 2 Name field.';
                }
                field("Suggested Station 3"; Rec."Suggested Station 3")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Preferred Station 3 field.';
                }
                field("Suggested Station 3 Name"; Rec."Suggested Station 3 Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Preferred Station 3 Name field.';
                }
                field("Transfer Reason Code"; Rec."Transfer Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Reason Code field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                group(Transfer)
                {
                    Caption = 'Transfer Details';
                    field("Transfer Date"; Rec."Transfer Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Transfer Date field.';
                        Editable = false;
                    }

                    field("Release Date"; Rec."Mobility Release Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Mobility Release Date field.';

                    }


                    field("Reporting Date"; Rec."Reporting Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Reporting Date field.';
                        Caption = 'Expected Reporting Date';
                    }
                    field("New Station"; Rec."New Station")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the New Station field.';

                    }
                    field("New Sattion Name"; Rec."New Sattion Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the New Sattion Name field.';

                    }
                    field("Professional Opinion"; Rec."Professional Opinion")
                    {
                        ApplicationArea = All;
                        MultiLine = true;
                        ToolTip = 'Specifies the value of the Professional Opinion field.';
                    }

                    field("To Hardship Area?"; Rec."To Hardship Area?")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the To Hardship Area? field.';
                    }



                    field(Distance; Rec.Distance)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Distance field.';
                        Editable = false;
                    }
                }
                // field(Status; Rec.Status)
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Status field.';
                // }

            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(69055),
                              "No." = field("Document No");
            }
            systempart(PyamentTermsLinks; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(PyamentTermsNotes; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
    actions
    {
        area(navigation)
        {

            // group("Request Approval")
            // {
            //     Caption = 'Request Approval';
            //     action(SendApprovalRequest)
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Send A&pproval Request';
            //         Image = SendApprovalRequest;
            //         Promoted = true;
            //         PromotedCategory = Process;

            //         trigger OnAction()
            //         var
            //             VarVariant: Variant;
            //             ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
            //         begin

            //             VarVariant := Rec;
            //             IF ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
            //                 ApprovalsMgmt.OnSendDocForApproval(VarVariant);

            //         end;
            //     }
            //     action(CancelApprovalRequest)
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Cancel Approval Re&quest';
            //         Enabled = true;
            //         Image = Cancel;
            //         Promoted = true;
            //         PromotedCategory = Process;

            //         trigger OnAction()
            //         var
            //             VarVariant: Variant;
            //             CustomApprovals: Codeunit "Custom Approvals Codeunit";
            //             ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
            //         begin
            //             VarVariant := Rec;
            //             CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
            //         end;
            //     }

            //     // action(Approvals)
            //     // {
            //     //     ApplicationArea = Basic;
            //     //     Caption = 'Approvals';
            //     //     Image = Approvals;
            //     //     Promoted = true;
            //     //     PromotedCategory = Process;
            //     //     PromotedIsBig = false;

            //     //     trigger OnAction()
            //     //     var
            //     //         ApprovalsMgt: Codeunit "Approvals Mgmt.";
            //     //     begin

            //     //         ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
            //     //     end;
            //     // }
            // }
            action(Print)
            {
                ApplicationArea = Suite;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");

                    Report.Run(69556, true, true, Rec);
                end;
            }
            action("Employee  Transfer History")
            {
                ApplicationArea = Basic;
                Caption = 'Employee  Transfer History';
                Image = History;
                RunObject = Page "Employee  Transfer History";
                RunPageLink = "Employee No" = field("Employee No");
            }
            action("Post")
            {
                ApplicationArea = Basic;
                Caption = 'Submit/ Release Application';
                Image = PostApplication;
                Enabled = Rec.Status = Rec.Status::Released;
                trigger OnAction()
                var
                    Transfer: Record "Employee Transfers";
                    Opinion: Record "Employee Transfers";
                    HRSetup: Record "Human Resources Setup";
                    NoSeriesMgt: Codeunit NoSeriesManagement;
                    DutyStation: Record "Duty Station";
                    // financialYear: Record "Financial Year Code";
                    Employee: record Employee;
                    usersetup: record "User Setup";

                begin
                    Rec.TestField(status, Rec.Status::Released);


                    if Status = Status::Released then begin
                        SendApproved();
                        Rec.status := Rec.Status::"Pending Current HOS Release";
                        Message('Sucessfully Submitted');

                    end;
                end;

            }

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Employee  Transfer History_Promoted"; "Employee  Transfer History")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Category6)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }
    // trigger OnNewRecord(BelowXrec: Boolean)
    // var
    //     myInt: Integer;
    // begin
    //     Rec.Type := Rec.Type::"...";
    //     Rec."Request Date" := Today;
    //     Rec."Document Type" := Rec."Document Type"::"Professional Opinion";
    // end;

    var
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        // Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PRN: Record "Purchase Header";
        // ProcCommType: Record "Procurement Committee Types";
        // IfsCommitteMembers: Record "IFS Tender Committee Member";
        NoOfMembers: Integer;
}

#pragma implicitwith restore

