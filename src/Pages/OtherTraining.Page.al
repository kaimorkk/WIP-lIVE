Page 52194086 "Other Training"
{
    AutoSplitKey = true;
    PageType = Card;
    SourceTable = "HR Company or Other Training1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    LookupPageID = "HR Employee List";

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        "Rec HR Employee": Record Employee;
                    begin
                         /*
                        "From HR Employee List".LOOKUPMODE(TRUE);
                        IF ("From HR Employee List".RUNMODAL = ACTION::LookupOK) THEN
                           "From HR Employee List".GETRECORD("Rec HR Employee");
                        
                        SETFILTER("Employee No.", ' = %1', "Rec HR Employee"."No.");
                        CurrPage.UPDATE;
                        */

                    end;
                }
            }
            label(Control1000000043)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19059753;
                Style = Strong;
                StyleExpr = true;
            }
            field(Description;Description)
            {
                ApplicationArea = Basic;
            }
            field(Posted;Posted)
            {
                ApplicationArea = Basic;
            }
            field(NeedSource;"Need Source")
            {
                ApplicationArea = Basic;
            }
            field(CourseTitle;"Course Title")
            {
                ApplicationArea = Basic;
            }
            field(Approved;Approved)
            {
                ApplicationArea = Basic;
            }
            field(TrainingCredits;"Training Credits")
            {
                ApplicationArea = Basic;
            }
            field(Post;Post)
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field(Dateofreassessment;"Date of re-assessment")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field(EducaionCredits;"Educaion Credits")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            label(Year)
            {
                ApplicationArea = Basic;
                Caption = 'Year';
            }
            field(CertificateNumber;"Certificate Number")
            {
                ApplicationArea = Basic;
            }
            field(Results;Results)
            {
                ApplicationArea = Basic;
            }
            field(Competency;Competency)
            {
                ApplicationArea = Basic;
            }
            field(CostIncurredByEmployee;"Cost Incurred By Employee")
            {
                ApplicationArea = Basic;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    // "Cost Incurred By Employee" := CalDate.SetCalDate("Cost Incurred By Employee");
                end;
            }
            label(Control1000000003)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19061770;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(OtherTraining)
            {
                Caption = 'Other Training';
                action(InformalTrainingList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Informal Training List';
                    RunObject = Page "HR Empl. Informal Training L";
                    RunPageLink = "Employee No."=field("Employee No.");
                    ShortCutKey = 'Shift+Ctrl+L';
                }
                separator(Action27)
                {
                    Caption = '';
                }
                action(LinkedDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Linked Documents';
                    RunObject = Page "HR Linked Docs";
                    RunPageLink = "Employee No"=field("Employee No.");
                    RunPageView = sorting("Employee No",ggg,Attachement)
                                  where(ggg=filter('25'));
                }
            }
        }
    }

    var
        CalDate: Codeunit "HR Dates";
        Text19059753: label 'Other Training';
        Text19061770: label 'Comments';
}

