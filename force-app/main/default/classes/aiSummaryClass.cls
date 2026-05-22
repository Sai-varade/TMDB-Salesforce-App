public class aiSummaryClass {
    
    public class GeminiResponse {
        public List<Candidate> candidates;
    }

    public class Candidate {
        public Content content;
    }

    public class Content {
        public List<Part> parts;
    }

    public class Part {
        public String text;
    }

    public static String getMovieSummary(String movieName, String movieReviews ,Decimal movierating){

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        String commmand = 'Summarize the about following movie in 100 words and also assume its review while summary and give peoper exact 100-120 proper in detrail summary and dont send add review in it. Review: ' + movieReviews + ' and its rating is ' + movierating + ' out of 10. The movie name is ' + movieName;
        req.setEndpoint('callout:Gemini');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody('{"contents": [{"parts": [{"text": "' + commmand + '"}]}]}');
        req.setTimeout(120000);
        HttpResponse res = http.send(req);
        
        if (res.getStatusCode() == 200) {

            GeminiResponse responseObj =
                (GeminiResponse) JSON.deserialize(
                    res.getBody(),
                    GeminiResponse.class
                );

            String summary = responseObj.candidates[0].content.parts[0].text;                
            return summary;

        } else {

            return 'Error: ' + res.getStatusCode() + ' - ' + res.getStatus();
        }
        
    }



}


