<!doctype html>
<html>
  <head>
    <title>app/models/authorization.rb - user model review</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/stylesheets/reset.css">
    <link rel="stylesheet" type="text/css" href="/stylesheets/grid.css">
    <link rel="stylesheet" type="text/css" href="/stylesheets/public.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
  </head>
  <body>
    <div class="container_14">
      <nav class="grid_14">
        <ul>
          <li><a href="/">Dashboard</a><a href="#dashboard">▶</a></li>
          <li><a href="#dashboard">user model review</a><a href="#dashboard">▶</a></li>
          <li><a href="#dashboard" class="current">authorization.rb</a></li>
        </ul>
      </nav>
      <div class="grid_1">
        &nbsp;
      </div>
      <div class="grid_13">
        <h2>authorization.rb</h2>
        <h3>Overview</h3>
        <p>This class is used along with the <a href="#">Omniauth gem</a> to represent a user&rsquo;s login session.</p>
        <div class="related">
          <h3>Related files</h3>
          <ul class="related_files">
            <li class="ruby"><a href="#file">authorization_test.rb</a></li>
            <li class="uml"><a href="#file">UML diagram</a></li>
          </ul>
        </div>
        <div class="related">
          <h3>Related resources</h3>
          <ul class="related_files">
            <li class="checklist"><a href="#file">Ruby style guide</a></li>
            <li class="hyperlink"><a href="#file">Omniauth gem</a></li>
          </ul>
        </div>
        <h3>All activity</h3>
        <ul class="all_activity collapsed">
          <li class="toggle"><a href="#activity" class="all">Show all</a></li>
          <li class="toggle"><a href="#activity" class="comments">3 comments</a></li>
          <li class="toggle"><a href="#activity" class="flags">1 flag</a></li>
          <li class="toggle"><a href="#activity" class="question">1 question</a></li>
          <li class="toggle"><a href="#activity" class="ideas">1 bulb</a></li>
        </ul>
        <h3>Action items</h3>
        <ul class="action_items">
          <li><a href="#user">You</a> Look into performance of <code>find_or_create_by_*</code> <a href="#" class="line-link">[line 16]</a></li>
        </ul>
        <h3>Code</h3>
        <table class="code ruby">
        <thead>
          <tr>
            <th>Line numbers</th>
            <th>Lines</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="line-numbers">
              <pre class="line-1">1</pre>
              <pre class="line-2">2</pre>
              <pre class="line-3">3</pre>
              <pre class="line-4">4</pre>
              <pre class="line-5">5</pre>
              <pre class="line-6">6</pre>
              <pre class="line-7">7<div class="question-indicator"><a href="#show-question">1</a></div></pre>
              <pre class="line-8">8<div class="idea-indicator"><a href="#show-idea">1</a></div></pre>
              <pre class="line-9">9</pre>
              <pre class="line-10">10</pre>
              <pre class="line-11">11<div class="comment-indicator"><a href="#show-comment">3</a></div></pre>
              <pre class="line-12">12</pre>
              <pre class="line-13">13</pre>
              <pre class="line-14">14</pre>
              <pre class="line-15">15</pre>
              <pre class="line-16">16<div class="flag-indicator"><a href="#show-comment">1</a></div></pre>
              <pre class="line-17">17</pre>
              <pre class="line-18">18</pre>
              <pre class="line-19">19</pre>
              <pre class="line-20">20</pre>
              <pre class="line-21">21</pre>
              <pre class="line-22">22</pre>
              <pre class="line-23">23</pre>
              <pre class="line-24">24</pre>
              <pre class="line-25">25</pre>
            </td>
            <td class="lines">
              <pre class="line-1"><span class="leading-spaces"></span><span class="line"><span class="Keyword">require</span> <span class="String"><span class="String">&quot;</span>digest/md5<span class="String">&quot;</span></span></span></pre>
              <pre class="line-2"><span class="line">&#8203;</span></pre>
              <pre class="line-3"><span class="leading-spaces"></span><span class="line"><span class="Keyword">class</span> <span class="TypeName">Authorization<span class="InheritedClassName"> <span class="InheritedClassName">&lt;</span> ActiveRecord::Base</span></span></span></pre>
              <pre class="line-4"><span class="leading-spaces">  </span><span class="line">belongs_to <span class="UserDefinedConstant"><span class="UserDefinedConstant">:</span>user</span></span></pre>
              <pre class="line-5"><span class="line">&#8203;</span></pre>
              <pre class="line-6"><span class="leading-spaces">  </span><span class="line"><span class="Keyword">def</span> <span class="FunctionName">self.find_or_create_for</span>(<span class="FunctionParameter">authentication_params</span>)</span></pre>
              <pre class="line-7"><span class="leading-spaces">    </span><span class="line">key <span class="Keyword">=</span> generate_key authentication_params[<span class="String"><span class="String">&quot;</span>uid<span class="String">&quot;</span></span>]</span></pre>
              <pre class="line-8"><span class="leading-spaces">    </span><span class="line"><span class="FunctionName">find_by_key</span>(key) <span class="Keyword">||</span> <span class="FunctionName">create_by_key</span>(key, authentication_params[<span class="String"><span class="String">&quot;</span>user_info<span class="String">&quot;</span></span>])</span></pre>
              <pre class="line-9"><span class="leading-spaces">  </span><span class="line"><span class="Keyword">end</span></span></pre>
              <pre class="line-10"><span class="line">&#8203;</span></pre>
              <pre class="line-11"><span class="leading-spaces">  </span><span class="line"><span class="Keyword">def</span> <span class="FunctionName">self.find_by_key</span>(<span class="FunctionParameter">key</span>)</span></pre>
              <pre class="line-12"><span class="leading-spaces">    </span><span class="line">first <span class="UserDefinedConstant"><span class="UserDefinedConstant">:</span>conditions</span> =&gt; {<span class="UserDefinedConstant"><span class="UserDefinedConstant">:</span>key</span> =&gt; key}, <span class="UserDefinedConstant"><span class="UserDefinedConstant">:</span>include</span> =&gt; <span class="UserDefinedConstant"><span class="UserDefinedConstant">:</span>user</span></span></pre>
              <pre class="line-13"><span class="leading-spaces">  </span><span class="line"><span class="Keyword">end</span></span></pre>
              <pre class="line-14"><span class="line">&#8203;</span></pre>
              <pre class="line-15"><span class="leading-spaces">  </span><span class="line"><span class="Keyword">def</span> <span class="FunctionName">self.create_by_key</span>(<span class="FunctionParameter">key<span class="FunctionParameter">,</span> user_info <span class="Keyword">=</span> <span class="FunctionParameter">{</span><span class="FunctionParameter">}</span></span>)</span></pre>
              <pre class="line-16 highlight" id="line-16"><span class="leading-spaces">    </span><div class="with-comments clearfix"><span class="line">user <span class="Keyword">=</span> <span class="LibraryObject">User</span>.<span class="FunctionName">find_or_create_by_email_address</span> user_info[<span class="String"><span class="String">&quot;</span>email<span class="String">&quot;</span></span>]</span><div class="comment"><div><a href="#user" class="user available">Naida</a> flagged this <strong>minor</strong> <span class="date">2 hours ago</span></div><p>This may have some performance problems as the user base grows. Have you considered using the user&rsquo;s ID for the lookup?</p></div><div class="comment"><div><a href="#user">You</a> added an action item <span class="date">about 10 minutes ago</span></div><p class="action_item">Look into performance of <code>find_or_create_by_*</code></p></div><form action="#comment"><label for="comment_body">Reply</label><textarea></textarea><input type="submit" value="Save"></form></div></pre>
              <pre class="line-17"><span class="leading-spaces">    </span><span class="line">create! <span class="UserDefinedConstant"><span class="UserDefinedConstant">:</span>key</span> =&gt; key, <span class="UserDefinedConstant"><span class="UserDefinedConstant">:</span>user</span> =&gt; user</span></pre>
              <pre class="line-18"><span class="leading-spaces">  </span><span class="line"><span class="Keyword">end</span></span></pre>
              <pre class="line-19"><span class="line">&#8203;</span></pre>
              <pre class="line-20"><span class="leading-spaces">  </span><span class="line"><span class="Keyword">def</span> <span class="FunctionName">self.generate_key</span>(<span class="FunctionParameter">uid</span>)</span></pre>
              <pre class="line-21"><span class="leading-spaces">    </span><span class="line"><span class="LibraryObject">Digest</span>::<span class="FunctionName">MD5</span>.<span class="FunctionName">hexdigest</span> uid</span></pre>
              <pre class="line-22"><span class="leading-spaces">  </span><span class="line"><span class="Keyword">end</span></span></pre>
              <pre class="line-23"><span class="line">&#8203;</span></pre>
              <pre class="line-24"><span class="leading-spaces">  </span><span class="line"><span class="Keyword">attr_writer</span> <span class="UserDefinedConstant"><span class="UserDefinedConstant">:</span>user_info</span></span></pre>
              <pre class="line-25"><span class="leading-spaces"></span><span class="line"><span class="Keyword">end</span></span></pre>
            </td>
          </tr>
        </tbody>
        </table>
      </div>
    </div>
    <script type="text/javascript">
      $(".with-comments").each(function() {
        var $this = $(this);
        var line  = $this.closest("pre").attr("id");
        $("." + line).height($this.height());
        console.log($this.outerHeight());
      });
    </script>
  </body>
</html>
