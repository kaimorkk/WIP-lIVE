page 69894 "Awaiting HR Actioning"
{
    Caption = 'Awaiting Director HR';

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
                field("Requestor Employee No"; Rec."Requestor Employee No")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requestor Employee No field.';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requestor Name field.';
                }
                field("Requestor Job Title"; Rec."Requestor Job Title")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Request Type"; Rec."Request Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Type field.';
                }
                field("Replacement Request No"; Rec."Replacement Request No")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Replacement Request No field.';
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
                field("HOS PJ No"; Rec."HOS PJ No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOS PJ No field.';
                }
                field("HOS Name"; Rec."HOS Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOS Name field.';
                }
                field("HOS Job Title"; Rec."HOS Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOS Job Title field.';
                }
                // field("Suggested Station 1"; Rec."Suggested Station 1")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Preferred Station 1 field.';
                // }
                // field("Suggested Station 1 Name"; Rec."Suggested Station 1 Name")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Preferred Station 1 Name field.'
                // }
                // field("Suggested Station 2"; Rec."Suggested Station 2")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Preferred Station 2 field.';
                // }
                // field("Suggested Station 2 Name"; Rec."Suggested Station 2 Name")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Preferred Station 2 Name field.';
                // }
                // field("Suggested Station 3"; Rec."Suggested Station 3")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Preferred Station 3 field.';
                // }
                // field("Suggested Station 3 Name"; Rec."Suggested Station 3 Name")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Preferred Station 3 Name field.';
                // }
                // field("Transfer Reason Code"; Rec."Transfer Reason Code")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Transfer Reason Code field.';
                // }
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
                    }
                    // field("Reporting Date"; Rec."Reporting Date")
                    // {
                    //     ApplicationArea = All;
                    //     ToolTip = 'Specifies the value of the Reporting Date field.';
                    // }
                    field("New Station"; Rec."New Station")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the New Station field.';

                    }
                    field("New Sattion Name"; Rec."New Sattion Name")
                    {
                        ApplicationArea = All;

                        Editable = false;
                        ToolTip = 'Specifies the value of the New Sattion Name field.';

                    }
                    // field("Professional Opinion"; Rec."Professional Opinion")
                    // {
                    //     ApplicationArea = All;
                    //     MultiLine = true;
                    //     Editable = false;
                    //     ToolTip = 'Specifies the value of the Professional Opinion field.';
                    // }
                    field("Mobility Observations"; Rec."Mobility Observations")
                    {
                        ApplicationArea = All;

                        MultiLine = true;
                        ToolTip = 'Specifies the value of the HOD Recommendation field.';
                        Editable = false;

                    }

                    field("Mobility Recommendation"; Rec."Mobility Recommendation")
                    {
                        ApplicationArea = All;

                        MultiLine = true;
                        Editable = false;
                        ToolTip = 'Specifies the value of the HOD Recommendation field.';
                    }
                    field("HOD Mobility Recommendation"; Rec."HOD Mobility Recommendation")
                    {
                        ApplicationArea = All;
                        MultiLine = true;
                        Editable = false;
                        ToolTip = 'Specifies the value of the HOD Recommendation field.';
                    }
                    field("HOD HR Recommendation"; Rec."HOD HR Recommendation")
                    {
                        ApplicationArea = All;
                        MultiLine = true;
                        ToolTip = 'Specifies the value of the HOD HR Recommendation field.';
                    }

                    field("To Hardship Area?"; Rec."To Hardship Area?")
                    {
                        ApplicationArea = All;

                        Editable = false;
                        ToolTip = 'Specifies the value of the To Hardship Area? field.';
                    }



                    field(Distance; Rec.Distance)
                    {
                        ApplicationArea = All;

                        Editable = false;
                        ToolTip = 'Specifies the value of the Distance field.';
                    }
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }

            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(69055),
                              "No." = FIELD("Document No");
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
            // action("Post")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Accept Transfer';

            //     Promoted = true;
            //     PromotedCategory = Process;
            //     Image = PostApplication;

            //     trigger OnAction()
            //     var
            //         Transfer: Record "Employee Transfers";
            //         Opinion: Record "Employee Transfers";
            //         HRSetup: Record "Human Resources Setup";
            //         NoSeriesMgt: Codeunit NoSeriesManagement;
            //         DutyStation: Record "Duty Station";
            //         financialYear: Record "Financial Year Code";
            //         Employee: record Employee;
            //         usersetup: record "User Setup";

            //     begin
            //         Rec.TestField(status, Rec.Status::"Pending HR Approval");
            //         Rec.TestField("New Station");
            //         Rec.TestField("HOD HR Recommendation");
            //         // Rec.TestField("Reporting Date");
            //         Rec.TestField("Transfer Date");

            //         if Status = Status::"Pending HR Approval" then begin
            //             Rec.status := Rec.Status::Released;
            //             Message('Sucessfully Accepted and Submitted to Mobility for Actioning');

            //         end;
            //     end;

            // }

            // action("Reject")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Reject Application';

            //     Promoted = true;
            //     PromotedCategory = Process;
            //     Image = Reject;
            //     trigger OnAction()
            //     var
            //         Transfer: Record "Employee Transfers";
            //         Opinion: Record "Employee Transfers";
            //         HRSetup: Record "Human Resources Setup";
            //         NoSeriesMgt: Codeunit NoSeriesManagement;
            //         DutyStation: Record "Duty Station";
            //         financialYear: Record "Financial Year Code";
            //         Employee: record Employee;
            //         usersetup: record "User Setup";

            //     begin
            //         Rec.TestField(status, Rec.Status::"Pending HR Approval");
            //         Rec.TestField("HOD HR Recommendation");

            //         if Status = Status::"Pending HR Approval" then begin
            //             Rec.status := Rec.Status::Rejected;
            //             Rec.Posted := true;
            //             Rec."Posted On" := CurrentDateTime;
            //             Message('Sucessfully Rejected and Submited');

            //         end;
            //     end;

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

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Employee  Transfer History_Promoted"; "Employee  Transfer History")
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

