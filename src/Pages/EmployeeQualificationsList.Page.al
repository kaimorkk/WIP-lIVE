Page 52194227 "Employee Qualifications List"
{
    ApplicationArea = Basic;
    Caption = 'Employee List';
    CardPageID = "Emp Qualification";
    Editable = false;
    PageType = List;
    SourceTable = Employee;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(FullName;FullName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Full Name';
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
            systempart(Control1900383207;Links)
            {
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Employee)
            {
                Caption = 'E&mployee';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name"=const(Employee),
                                  "No."=field("No.");
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID"=const(5200),
                                      "No."=field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action(DimensionsMultiple)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';

                        trigger OnAction()
                        var
                            Employee: Record Employee;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Employee);
                            DefaultDimMultiple.SetMultiEmployee(Employee);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action(Picture)
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No."=field("No.");
                }
                action(AlternativeAddresses)
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No."=field("No.");
                }
                action(Relatives)
                {
                    ApplicationArea = Basic;
                    Caption = '&Relatives';
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No."=field("No.");
                }
                action(MiscArticleInformation)
                {
                    ApplicationArea = Basic;
                    Caption = 'Mi&sc. Article Information';
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No."=field("No.");
                }
                action(ConfidentialInformation)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Information';
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No."=field("No.");
                }
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualifications';
                    RunObject = Page "Employee Qualifications";
                    RunPageLink = "Employee No."=field("No.");
                }
                action(Absences)
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No."=field("No.");
                }
                separator(Action51)
                {
                }
                action(AbsencesbyCategories)
                {
                    ApplicationArea = Basic;
                    Caption = 'Absences by Ca&tegories';
                    RunObject = Page "Empl. Absences by Categories";
                    RunPageLink = "No."=field("No."),
                                  "Employee No. Filter"=field("No.");
                }
                action(MiscArticlesOverview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles &Overview';
                    RunObject = Page "Misc. Articles Overview";
                }
                action(ConfidentialInfoOverview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Con&fidential Info. Overview';
                    RunObject = Page "Confidential Info. Overview";
                }
            }
        }
    }
}

