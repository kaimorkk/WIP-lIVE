Page 52194177 "HR Employee List"
{
    ApplicationArea = Basic;
    CardPageID = "HR Employee";
    PageType = List;
    SourceTable = Employee;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Initials;Initials)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(JobTitle;"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(PostCode;"Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CountryRegionCode;"Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Extension;Extension)
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo;"Phone No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(MobilePhoneNo;"Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EMail;"E-Mail")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(StatisticsGroupCode;"Statistics Group Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ResourceNo;"Resource No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(SearchName;"Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Comment;Comment)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000003;Links)
            {
                Visible = false;
            }
            systempart(Control1000000001;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Create Imprest A/C")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                var
                    EmpRec: Record Employee;
                begin
                    if Confirm(Text000,false) then begin
                    CurrPage.SetSelectionFilter(EmpRec);
                     if EmpRec.Find('-') then
                       repeat
                        CreateImprestAC(EmpRec);
                       until
                        EmpRec.Next=0;
                    end;
                end;
            }
        }
    }

    var
        Text000: label 'Are you sure you want to Create Imprest Account''s for the selected employees?';
}

