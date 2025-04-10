
page 51006 "Employee Transfer"
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
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    // Editable = false;
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
                field("Reason(s) for Appeal"; Rec."Reason(s) for Appeal")
                {
                    ApplicationArea = All;
                    Visible = Editable1;
                    ToolTip = 'Specifies the value of the Reason(s) for Appeal field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
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
                field("Suggested Station 1"; Rec."Suggested Station 1")
                {
                    ApplicationArea = All;
                }
                field("Suggested Station 1 Name"; Rec."Suggested Station 1 Name")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field("Suggested Station 2"; Rec."Suggested Station 2")
                {
                    ApplicationArea = All;
                }
                field("Suggested Station 2 Name"; Rec."Suggested Station 2 Name")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field("Suggested Station 3"; Rec."Suggested Station 3")
                {
                    ApplicationArea = All;
                }
                field("Suggested Station 3 Name"; Rec."Suggested Station 3 Name")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Transfer Reason Code"; Rec."Transfer Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Reason Code field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                    Editable = false;
                    MultiLine = true;
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

                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }

            }
            group("Approvals")
            {
                Editable = Rec.Status = Rec.Status::"Pending Approval";

                field("Professional Opinion"; Rec."Professional Opinion")
                {
                    ApplicationArea = All;
                }
                field("Current HOS Remarks"; Rec."Current HOS Remarks")
                {
                    ApplicationArea = All;
                }
                field("Mobility Recommendation"; Rec."Mobility Recommendation")
                {
                    ApplicationArea = All;
                }
                field("HOD Mobility Recommendation"; Rec."HOD Mobility Recommendation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOD Recommendation field.';
                }
                field("HOD HR Recommendation"; Rec."HOD HR Recommendation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOD HR Recommendation field.';
                }
            }
            part(PreviousStations; "Employee  Transfer History")
            {

                SubPageLink = "Employee No" = field("Employee No");
                ApplicationArea = Basic;

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
                    if Rec.Status = Rec.Status::Open then begin
                        Rec.status := Rec.Status::"Pending HOD Reccomendation";
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
        Rec.Type := Rec.Type::"Self initiated";
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
