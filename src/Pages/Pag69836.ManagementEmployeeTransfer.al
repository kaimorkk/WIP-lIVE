page 69836 "Management Employee Transfer"
{

    Caption = 'Employee Transfer';
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
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Requestor Employee No"; Rec."Requestor Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requestor Employee No field.';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requestor Name field.';
                }
                field("Requestor Job Title"; Rec."Requestor Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Request Type"; Rec."Request Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Type field.';
                }
                field("Replacement Request No"; Rec."Replacement Request No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Replacement Request No field.';
                }
                group("Employee Details")
                {

                    field("Employee No"; Rec."Employee No")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Employee No field.';
                    }
                    field("Employee Name"; Rec."Employee Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Employee Name field.';
                    }
                    field(PLWD; Rec.PLWD)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the PLWD field.';
                    }
                    field(Age; Rec.Age)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Age field.';
                    }
                }
                field("Transfer Appeal"; Rec."Transfer Appeal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Appeal field.';
                }
                field("Reason(s) for Appeal"; Rec."Reason(s) for Appeal")
                {
                    ApplicationArea = All;
                    Visible = Editable1;
                    ToolTip = 'Specifies the value of the Reason(s) for Appeal field.';
                }

                field("Original Station"; Rec."Original Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Station field.';
                }
                field("Original Station Name"; Rec."Original Station Name")
                {
                    ApplicationArea = All;
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
                // field("Transfer Date"; Rec."Transfer Date")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Transfer Date field.';
                // }
                // field("New Station"; Rec."New Station")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the New Station field.';

                // }
                // field("New Sattion Name"; Rec."New Sattion Name")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the New Sattion Name field.';

                // }

                // field("To Hardship Area?"; Rec."To Hardship Area?")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the To Hardship Area? field.';
                // }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }


                // field(Distance; Rec.Distance)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Distance field.';
                // }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
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
                field(Type; Type)
                {
                    ApplicationArea = All;
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
                Caption = 'Submit Application';
                Image = PostApplication;
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
                    Rec.TestField(status, Rec.Status::Open);
                    Rec.TestField("HOS PJ No");
                    Rec.TestField("Employee No");
                    Rec.TestField("Requestor Employee No");
                    Rec.TestField(Remarks);
                    if Rec.Status = Rec.Status::Open then begin
                        Rec.status := Rec.Status::"Pending Mobility Officer";
                        Message('Sucessfully Submitted');
                    end;
                end;
            }
            // action("Post")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Create Professional Opinion';
            //     Image = PostApplication;
            //     Enabled = Rec.Status = Rec.Status::Released;
            //     trigger OnAction()
            //     var
            //         Transfer: Record "Employee Transfers";
            //         Opinion: Record "Employee Transfers";
            //         HRSetup: Record "Human Resources Setup";
            //         NoSeriesMgt: Codeunit NoSeriesManagement;


            //     begin
            //         Rec.TestField(Posted, false);
            //         Rec.TestField(status, Rec.Status::Released);
            //         if Rec.Posted = false then begin
            //             Opinion.init;

            //             Opinion."Document Type" := Opinion."Document Type"::"Professional Opinion";
            //             // Opinion."Document No" := Opinion."Document No";
            //             Opinion."Transfer No" := Rec."Document No";
            //             Opinion.Type := Opinion.Type::"...";
            //             Opinion."Request Date" := Rec."Request Date";
            //             Opinion."Employee No" := Rec."Employee No";
            //             Opinion."Employee Name" := Rec."Employee Name";
            //             Opinion."Original Station" := Rec."Original Station";
            //             Opinion."New Station" := Rec."New Station";
            //             Opinion."Original Station Name" := Rec."Original Station Name";
            //             Opinion."New Sattion Name" := Rec."New Sattion Name";
            //             Opinion."To Hardship Area?" := Rec."To Hardship Area?";
            //             Opinion.Distance := Rec.Distance;
            //             Opinion."Suggested Station 1" := Rec."Suggested Station 1";
            //             Opinion."Suggested Station 1 Name" := Rec."Suggested Station 1 Name";
            //             Opinion."Suggested Station 2" := Rec."Suggested Station 2";
            //             Opinion."Suggested Station 2 Name" := Rec."Suggested Station 2 Name";
            //             Opinion."Suggested Station 3" := Rec."Suggested Station 3";
            //             Opinion."Suggested Station 3 Name" := Rec."Suggested Station 3 Name";
            //             Opinion."Job Title" := Rec."Job Title";
            //             Opinion."Remarks" := Rec."Remarks";

            //             if Opinion.insert(true) then begin
            //                 Message('Professional Opinion %1 Sucessfully created, Proceed', Opinion."Document No");

            //             end;
            //         end;
            //         Rec.Posted := true;
            //         Rec."Posted On" := CurrentDateTime;

            //     end;
            // }


        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowXrec: Boolean)
    var
        myInt: Integer;
    begin
        Rec.Type := Rec.Type::"Management initiated";
        Rec."Request Date" := Today;
        Rec."Document Type" := Rec."Document Type"::Application;
    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        if rec."Transfer Appeal" = true then begin
            Editable1 := true
        end else begin
            Editable1 := false;
        end;

    end;

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
        Editable1: Boolean;
}

#pragma implicitwith restore
