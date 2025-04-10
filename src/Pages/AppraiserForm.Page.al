Page 52194118 "Appraiser Form"
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
                field(AppraisalPeriod;"Appraisal Period")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AppraiseesNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s No.';
                    Editable = false;
                }
                field(AppraisalCategory;"Appraisal Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AppraiserNo;"Appraiser No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(JobPosition;Employee.Position)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Position';
                }
                field(AppraiseesNames;Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s Names';
                }
                field(AppraisersName;"Appraisers Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(JobGroup;"Job Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AppraisalNo;"Appraisal No")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseesJobTitle;Employee."Job Title")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s Job Title';
                }
            }
            label(Control1000000025)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19018837;
                Style = Strong;
                StyleExpr = true;
            }
            part(Control1000000024;"Performance Plan")
            {
                SubPageLink = "Employee No"=field("Employee No"),
                              "Appraisal Category"=field("Appraisal Category"),
                              "Appraisal Period"=field("Appraisal Period");
            }
            part(Control1000000014;"Appraiser and Appraisee Comm")
            {
                SubPageLink = "Employee No"=field("Employee No"),
                              "Appraisal Category"=field("Appraisal Category"),
                              "Appraisal Period"=field("Appraisal Period");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(NextPage)
            {
                ApplicationArea = Basic;
                Caption = 'Next Page   >>';

                trigger OnAction()
                begin
                    if EmployeeApp.Get("Appraisal No") then
                    Page.RunModal(51511415,EmployeeApp);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(NextPage_Promoted; NextPage)
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
        Employee: Record Employee;
        Jobs: Record "Company Jobs1";
        EmployeeApp: Record "Employee Appraisals1";
        Text19018837: label 'Performance Plan';
}

