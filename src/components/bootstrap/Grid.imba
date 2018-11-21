
export tag Container < div
  prop fluid

  def render
    if @fluid
      <self.container-fluid>
    else
      <self.container>


export tag Row < div
  def render
    <self.row>


export tag Column < div
  def render
    <self.col>
