page 50222 "Airtime Allowance Card"
{
    Caption = 'Airtime Allowance Card';
    PageType = Card;
    SourceTable = "Airtime Allocation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requestor ID"; Rec."Requestor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requestor ID field.';
                }
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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part("HR Airtime Staff"; "HR Airtime Staff")
            {
                SubPageLink = "Document No" = field("No");
                ApplicationArea = All;

            }
        }
    }
    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';

                action(Suggest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Suggest Employees';
                    Image = PostPrint;
                    ToolTip = 'Executes the Post Claim action.';
                    trigger OnAction()
                    var
                        HrEmp: Record Employee;
                        Airtimer: Record "HR Airtime Staff";
                        Airtm: Record "Employee Airtime Allocation";
                    begin

                        if Confirm('Do you Wish to suggest Employees this transaction?', false) = false then begin exit end;
                        HrEmp.Reset;
                        HrEmp.setrange(HrEmp.Status, HrEmp.Status::Active);
                        if HrEmp.find('-') then begin
                            repeat
                                Airtm.Reset();
                                Airtm.SetRange("Employee No", HrEmp."No.");
                                if Airtm.FindSet() then begin
                                    repeat
                                        Airtimer.init;
                                        Airtimer."Document No" := "No";
                                        Airtimer."Line No" := Airtm."Line No";
                                        Airtimer."Employee No" := HrEmp."No.";
                                        Airtimer.Validate("Employee No");
                                        Airtimer.Airtime := Airtm."Airtime Amount";
                                        Airtimer."Phone No." := Airtm."Phone No.";
                                        Airtimer."Service Provider Name" := Airtm."Service Provider Name";
                                        Airtimer."Service Provider No" := Airtm."Service Provider No";
                                        Airtimer.Type := Airtm.Type;
                                        Airtimer.Insert();
                                    until Airtm.Next() = 0;
                                end;
                            until HrEmp.Next = 0;
                        end;
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PrintCover;
                    //Visible = corec;

                    trigger OnAction()
                    begin
                        TestField(Posted, false);
                        TestField("Document Status", "document status"::Submitted);
                        //Procurement.PublishITT(Rec);
                        if Posted = false then begin

                            Posted := true;
                            "Posted By" := UserId;
                            "Posting Time" := Time;
                            "Posting Date" := Today;
                            "Document Status" := "document status"::Closed;
                            Modify(true);
                            Message('Posted Successfully');
                        end else begin
                            Message('Error!, This is Already Posted');
                        end;
                    end;
                }
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
                action(Reportsd)
                {
                    ApplicationArea = Basic;
                    Caption = 'Service Provider Airtime Loading List';
                    Image = Report;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.Reset();
                        Rec.SetRange(No, No);
                        Report.run(69800, true, true, Rec)

                    end;
                }
                //69801
                action(Reportsd2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Airtime Summary Report';
                    Image = Report;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.Reset();
                        Rec.SetRange(No, No);
                        Report.run(69801, true, true, Rec)

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

                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }


            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Suggest_Promoted; Suggest)
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Report)
            {
                actionref(Reportsd_Promoted; Reportsd)
                {
                }
                actionref(Reportsd2_Promoted; Reportsd2)
                {
                }
            }
        }
    }
}
