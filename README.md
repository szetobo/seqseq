# SeqSeq

An auto-increment sequence generator - similar to DB's sequence number.

## Requirements

* PostgreSQL
* ActiveRecord

## Installation

1. Add this line to your application's Gemfile: ``gem 'seqseq'``

2. And then execute: ``bundle install``

3. Create model/migration file using SeqSeq generator: ``rails generate seqseq:install [model_name]``

    model_name default to `AutoSequence`

4. DB migrate: ``rake db:migrate``

## Usage

Sequence number will be generate automatically upon first call to
`next_val`.  Options `start_with` & `step_by` can be provided to
customize the sequence generation on sequence creation, subsequent call
will ignore these options for existing sequence.

```ruby
AutoSequence.next_val('product_id', 1)   # => 1

AutoSequence.next_val('product_id', 2, start_with: 11)  # => 11
AutoSequence.next_val('product_id', 2, start_with: 11)  # => 12, start_with has no effect
AutoSequence.next_val('product_id', 2, start_with: 11)  # => 13, start_with has no effect

AutoSequence.next_val('product_id', 3, step_by: 5)   # => 1
AutoSequence.next_val('product_id', 3, step_by: 10)  # => 6,  step_by has no effect
AutoSequence.next_val('product_id', 3, step_by: 20)  # => 11, step_by has no effect
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
