Page 52193871 "Short List"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Recruitment Needs1";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Positions;Positions)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PositionFilter;"No Filter")
                {
                    ApplicationArea = Basic;
                    Caption = 'Position Filter';
                }
            }
            group(ShortListing)
            {
                Caption = 'Short Listing';
                Editable = true;
                field(StageCode;"Stage Code")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Shortlisted;"Stage Shortlist")
            {
                Caption = 'Short Listed Candidates';
                SubPageLink = "Need Code"=field("No."),
                              "Stage Code"=field(Stage);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Applicants)
            {
                Caption = 'Applicants';
                Visible = true;
                action(ApplicantsCard)
                {
                    ApplicationArea = Basic;
                    Caption = 'Applicants Card';

                    trigger OnAction()
                    begin
                        if Applicants.Get(CurrPage.Shortlisted.Page.GetApplicantNo) then
                        Page.RunModal(51511149,Applicants);
                    end;
                }
                action(LetterofRegret)
                {
                    ApplicationArea = Basic;
                    Caption = 'Letter of Regret';

                    trigger OnAction()
                    begin
                        StageShortlist.Reset;
                        StageShortlist.SetRange(StageShortlist."Need Code","No.");
                        StageShortlist.SetRange(StageShortlist."Stage Code","Stage Code");
                        StageShortlist.SetRange(StageShortlist.Qualified,false);
                        if StageShortlist.Find('-') then
                          Report.RunModal(51511396,true,true,StageShortlist);
                    end;
                }
                action(LetterofSuccess)
                {
                    ApplicationArea = Basic;
                    Caption = 'Letter of Success';

                    trigger OnAction()
                    begin
                        StageShortlist.Reset;
                        StageShortlist.SetRange(StageShortlist."Need Code","No.");
                        StageShortlist.SetRange(StageShortlist."Stage Code","Stage Code");
                        StageShortlist.SetRange(StageShortlist.Qualified,true);
                        if StageShortlist.Find('-') then
                          Report.RunModal(51511395,true,true,StageShortlist);
                    end;
                }
            }
        }
        area(processing)
        {
            group("Short List")
            {
                Caption = 'Short List';
                action(Shortlist)
                {
                    ApplicationArea = Basic;
                    Caption = 'Short list';

                    trigger OnAction()
                    begin
                        if "Stage Code" <> '' then begin

                        StageShortlist.Reset;
                        StageShortlist.SetRange(StageShortlist."Need Code","No.");
                        StageShortlist.SetRange(StageShortlist."Stage Code","Stage Code");
                        StageShortlist.DeleteAll;

                        Applications.Reset;
                        Applications.SetRange(Applications."Recruitment Need Code","No.");
                        if Applications.Find('-') then begin
                        repeat

                        Applicants.Reset;
                        Applicants.SetRange(Applicants."No.",Applications.ApplicantID);
                        if Applicants.Find('-') then begin

                        Qualified:= true;

                        ShortListCriteria.Reset;
                        ShortListCriteria.SetRange(ShortListCriteria."Need Code","No.");
                        ShortListCriteria.SetRange(ShortListCriteria."Stage Code","Stage Code");
                        if ShortListCriteria.Find('-') then begin
                        StageScore:=0;
                        repeat
                        AppQualifications.Reset;
                        AppQualifications.SetRange(AppQualifications."Applicant No.",Applicants."No.");
                        AppQualifications.SetRange(AppQualifications."Qualification Code",ShortListCriteria.Qualification);
                        if AppQualifications.Find('-') then begin
                          StageScore:=StageScore + AppQualifications."Score ID";
                         if AppQualifications."Score ID" < ShortListCriteria."Desired Score" then
                          Qualified:= false;
                        end else begin
                          Qualified:= false;
                        end;

                        until ShortListCriteria.Next = 0;
                        end;

                        StageShortlist."Need Code":="No.";
                        StageShortlist."Stage Code":="Stage Code";
                        StageShortlist.Applicant:=Applicants."No.";
                        StageShortlist."Stage Score":=StageScore;
                        StageShortlist.Qualified:=Qualified;
                        StageShortlist."First Name":=Applicants."First Name";
                        StageShortlist."Middle Name":=Applicants."Middle Name";
                        StageShortlist."Last Name":=Applicants."Last Name";
                        StageShortlist."ID No":=Applicants."ID Number";
                        StageShortlist.Gender:=Applicants.Gender;
                        StageShortlist."Marital Status":=Applicants."Marital Status";
                        StageShortlist.Insert;

                        end;

                        until Applications.Next =0;
                        end;
                        RecCount:= 0;
                        MyCount:=0;
                        StageShortlist.Reset;
                        StageShortlist.SetRange(StageShortlist."Need Code","No.");
                        StageShortlist.SetRange(StageShortlist."Stage Code","Stage Code");
                        if StageShortlist.Find('-') then begin
                        RecCount:=StageShortlist.Count ;
                        StageShortlist.SetCurrentkey(StageShortlist."Stage Score");
                        StageShortlist.Ascending;
                        repeat
                        MyCount:=MyCount + 1;
                        StageShortlist.Position:=RecCount - MyCount;
                        StageShortlist.Modify;
                        until StageShortlist.Next = 0;
                        end;

                        Message('%1','Shortlisting Competed Successfully.');

                        end else
                        Message('%1','You must select the stage you would like to shortlist.');
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Shortlist_Promoted; Shortlist)
                {
                }
            }
        }
    }

    var
        ShortListCriteria: Record "R. Shortlisting Criteria1";
        AppQualifications: Record "Applicants Qualification1";
        Applicants: Record Applicants1;
        Qualified: Boolean;
        StageScore: Decimal;
        StageShortlist: Record "Stage Shortlist1";
        MyCount: Integer;
        RecCount: Integer;
        Text19078293: label 'Short Listing';
        Text19057439: label 'Short Listed Candidates';
        Applications: Record "Job Applications Table";
}

