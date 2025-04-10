Page 52194113 "Appraisal Page 2"
{
    PageType = Card;
    SourceTable = "Employee Appraisals1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field(AppraisalPeriod; "Appraisal Period")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalType; "Appraisal Type")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseesNo; "Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s No.';
                }
                field(AppraiseeID; "Appraisee ID")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeName; "Appraisee Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseesJobTitle; "Appraisee's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseesJobID; "Job ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s Job ID';
                }
                field(DepartmentName; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateName; "Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserNo; "Appraiser No")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisersName; "Appraisers Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisersJobTitle; "Appraiser's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000008; "Appraiser and Appraisee Narrat")
            {
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Appraisal Type" = field("Appraisal Type");
            }
            field(GeneralComments; "General Comments")
            {
                ApplicationArea = Basic;
            }
            field(Rating; Rating)
            {
                ApplicationArea = Basic;
                Caption = 'Overall Rating';
            }
            field(AppraiseeAgreementWithRating; "Agreement With Rating")
            {
                ApplicationArea = Basic;
                Caption = 'Appraisee Agreement With Rating';
            }
            field(RatingDescription; "Rating Description")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            label(Control1000000035)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19016900;
                Style = Strong;
                StyleExpr = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(PerformanceAppraisal)
            {
                Caption = 'Performance Appraisal';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.SendAppraisalApprovalRequest(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    begin
                        //  //if ApprovalMgt.CancelAppraisalApprovalRequest(Rec,true,true) then;
                    end;
                }
            }
        }
        area(processing)
        {
            action("<<Back")
            {
                ApplicationArea = Basic;
                Caption = '<<Back';

                trigger OnAction()
                begin
                    if EmployeeAppraisals.Get("Appraisal No") then
                        Page.RunModal(51511409, EmployeeAppraisals);
                end;
            }
            action(Preview)
            {
                ApplicationArea = Basic;
                Caption = 'Preview';

                trigger OnAction()
                begin
                    EmployeeAppraisals.Reset;
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Employee No", "Employee No");
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Appraisal Period", "Appraisal Period");
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Appraisal Category", "Appraisal Category");
                    EmployeeAppraisals.SetRange(EmployeeAppraisals."Appraisal No", "Appraisal No");
                    if EmployeeAppraisals.Find('-') then begin
                        if EmployeeAppraisals."Appraisal Type" = 'Annual' then
                            Report.RunModal(51511181, true, false, EmployeeAppraisals)
                        else if EmployeeAppraisals."Appraisal Type" = 'Mid Year' then
                            Report.RunModal(51511188, true, false, EmployeeAppraisals);
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("<<Back_Promoted"; "<<Back")
                {
                }
                actionref(Preview_Promoted; Preview)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Employee.Get("Employee No") then
            //IF Employee.Position<>'' THEN
            if Jobs.Get(Employee.Position) then
        ;
    end;

    var
        EmployeeAppraisals: Record "Employee Appraisals1";
        Employee: Record Employee;
        Jobs: Record "Company Jobs1";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        Text19016900: label 'Overall Rating';
}

