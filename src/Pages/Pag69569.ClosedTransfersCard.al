page 69569 "Closed Transfers Card"
{
    Caption = 'Closed Transfers Card';
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
                        Editable = false;
                        ToolTip = 'Specifies the value of the Transfer Date field.';
                    }
                    field("New Station"; Rec."New Station")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the value of the New Station field.';

                    }
                    field("New Sattion Name"; Rec."New Sattion Name")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the value of the New Sattion Name field.';

                    }
                    field("Professional Opinion"; Rec."Professional Opinion")
                    {
                        ApplicationArea = All;
                        MultiLine = true;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Professional Opinion field.';
                    }
                    field("To Hardship Area?"; Rec."To Hardship Area?")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the value of the To Hardship Area? field.';
                    }
                    field(Distance; Rec.Distance)
                    {
                        Editable = false;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Distance field.';
                    }
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Reporting Date field.';
                }
                field("Actual Reporting Date"; Rec."Actual Reporting Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Actual Reporting Date field.';
                }
                field("Reason(s) for Appeal"; Rec."Reason(s) for Appeal")
                {
                    ApplicationArea = All;
                    multiline = true;
                    ToolTip = 'Specifies the value of the Reason(s) for Appeal field.';
                }

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

            group("Request Approval")
            {
                Caption = 'Request Approval';
                Visible = false;

                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin

                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
            }
            action(Print)
            {
                ApplicationArea = Suite;
                Caption = '&Print';
                // Ellipsis = true;
                Image = Print;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    // if Rec."status" = Rec."Status"::"Awaiting HOS" then begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");
                    Report.Run(69556, true, false, Rec);
                    //end;
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
            action("Confirm")
            {
                ApplicationArea = Basic;
                Caption = 'Acknowledge Employee Reporting';
                Image = PostApplication;
                Enabled = Rec.Status = Rec.Status::"Awaiting HOS";
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
                    Rec.TestField(Posted, false);
                    Rec.TestField(status, Rec.Status::"Awaiting HOS");
                    Rec.TestField("Actual Reporting Date");
                    if Rec.Status = Rec.Status::"Awaiting HOS" then begin
                        Employee.Reset();
                        Employee.SetRange("No.", Rec."Employee No");
                        if Employee.FindFirst() then
                            Employee."Current Duty Station" := Rec."New Station";
                        //  if type = type::"Management initiated" then begin
                        //  Employee.Validate("Current Duty Station");
                        //  end;
                        if Employee.Modify(true) then begin
                            Rec.Posted := true;
                            Rec."Posted On" := CurrentDateTime;
                            Rec.Status := Rec.Status::"HOS Confirmed";
                            Message('Employee Reporting Sucessfully Confirmed');
                        end;
                    end;
                end;
            }

            action("Appeal")
            {
                ApplicationArea = Basic;
                Caption = 'Appeal Transfer';
                Image = PostApplication;
                Enabled = Rec.Status = Rec.Status::"HOS Confirmed";
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
                    // Rec.TestField(Posted, false);
                    Rec.TestField(status, Rec.Status::"HOS Confirmed");
                    Rec.TestField("Actual Reporting Date");


                    if Rec.Status = Rec.Status::"HOS Confirmed" then begin
                        Employee.Reset();
                        Employee.SetRange("No.", Rec."Employee No");
                        if Employee.FindFirst() then
                            Employee."Current Duty Station" := Rec."New Station";

                        Opinion.init;

                        Opinion."Document Type" := Opinion."Document Type"::Application;
                        Opinion."Transfer No" := Rec."Document No";
                        Opinion.Type := Rec.Type;
                        Opinion."Request Date" := Rec."Request Date";
                        Opinion."Employee No" := Rec."Employee No";
                        Opinion.validate("Employee No");
                        Opinion."Employee Name" := Rec."Employee Name";
                        Opinion."Original Station" := Rec."Original Station";
                        Opinion."New Station" := Rec."New Station";
                        Opinion."Original Station Name" := Rec."Original Station Name";
                        Opinion."New Sattion Name" := Rec."New Sattion Name";
                        Opinion."To Hardship Area?" := Rec."To Hardship Area?";
                        Opinion.Distance := Rec.Distance;
                        Opinion."Suggested Station 1" := Rec."Suggested Station 1";
                        Opinion."Suggested Station 1 Name" := Rec."Suggested Station 1 Name";
                        Opinion."Suggested Station 2" := Rec."Suggested Station 2";
                        Opinion."Suggested Station 2 Name" := Rec."Suggested Station 2 Name";
                        Opinion."Suggested Station 3" := Rec."Suggested Station 3";
                        Opinion."Suggested Station 3 Name" := Rec."Suggested Station 3 Name";
                        Opinion."Job Title" := Rec."Job Title";
                        Opinion."Remarks" := Rec."Remarks";
                        Opinion."Transfer Appeal" := true;
                        Opinion.Status := Rec.Status::Open;
                        Opinion."Reason(s) for Appeal" := Rec."Reason(s) for Appeal";
                        Opinion."Original Transfer No" := Rec."Document No";
                        Opinion.Insert(true);

                        Message('Appeal Created successfully');
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref("Employee  Transfer History_Promoted"; "Employee  Transfer History")
                {
                }
                actionref(Appeal_Promoted; Appeal)
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

#pragma implicitwith restore

