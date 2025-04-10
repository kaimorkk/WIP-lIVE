Page 52193874 "Short Listing"
{
    ApplicationArea = Basic;
    CardPageID = "Short List";
    PageType = List;
    SourceTable = "Recruitment Needs1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
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
                field(Stage;Stage)
                {
                    ApplicationArea = Basic;
                }
                field(Score;Score)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Shortlist)
            {
                ApplicationArea = Basic;
                Caption = 'Shortlist';

                trigger OnAction()
                begin
                    ShortListCriteria.Reset;
                    ShortListCriteria.SetRange(ShortListCriteria."Need Code","No.");
                    ShortListCriteria.SetRange(ShortListCriteria."Stage Code",Stage);

                    StageShortlist.Reset;
                    StageShortlist.SetRange(StageShortlist."Need Code","No.");
                    StageShortlist.SetRange(StageShortlist."Stage Code",Stage);
                    StageShortlist.DeleteAll;


                    Applications.Reset;
                    Applications.SetRange(Applications."Recruitment Need Code","No.");
                    if Applications.Find('-') then begin
                    repeat
                    Applicants.Reset;
                    Applicants.SetRange(Applicants."No.",Applications.ApplicantID);
                    if Applicants.Find('-') then begin
                    Qualified:= true;
                    //REPEAT

                    if ShortListCriteria.Find('-') then begin
                    StageScore:=0;
                    repeat
                    AppQualifications.Reset;
                    AppQualifications.SetRange(AppQualifications."Applicant No.",Applicants."No.");
                    AppQualifications.SetRange(AppQualifications."Qualification Code",ShortListCriteria.Qualification);
                    if AppQualifications.Find('-') then begin
                      StageScore:=StageScore + AppQualifications."Score ID";
                      if AppQualifications."Score ID" < ShortListCriteria."Desired Score" then
                        Qualified:= false
                    end else begin
                      Qualified:= false
                    end

                    until ShortListCriteria.Next = 0
                    end;

                    StageShortlist."Need Code":="No.";
                    StageShortlist."Stage Code":=Stage;
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

                    until Applications.Next = 0;
                    end;

                    Message('%1','Shortlisting Competed.')
                end;
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
        Text19057439: label 'Short Listed Candidates';
        Applications: Record "Job Applications Table";
}

